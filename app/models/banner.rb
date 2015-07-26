class Banner < ActiveRecord::Base
  has_many :impressions
  has_many :clicks
  has_many :conversions, through: :clicks
  has_many :campaigns, through: :clicks

  def self.top_banners(campaign:)
    banners = top_banners_by_revenue(campaign: campaign)

    if banners.count < 5
      banners += top_banners_by_clicks(campaign: campaign)
    end

    if banners.count < 5
      banners += top_banners_by_impressions(campaign: campaign)
    end

    banners
  end

  def self.top_banners_by_revenue(campaign:)
      select('banners.*, SUM(conversions.revenue) AS sum_revenue').joins(:conversions)
        .where('clicks.campaign_id = ?', campaign)
        .group(:id)
        .order('sum_revenue DESC')
        .to_a
    end

    def self.top_banners_by_clicks(campaign:, limit: 5)
      where(campaign_id: campaign).group(:banner_id, :id)
        .where(revenue: nil)
        .select('SUM(revenue) AS sum_revenue, banners.*')
        .order('sum_revenue desc NULLS LAST')
        .to_a
        # .limit(limit)
    end

    def self.top_banners_by_impressions(campaign:, limit: 5)
      where(campaign_id: campaign).group(:banner_id, :id)
        .where('revenue IS NOT NULL')
        .select('SUM(revenue) AS sum_revenue, banners.*')
        .order('sum_revenue desc NULLS LAST')
        .to_a
        # .limit(limit)
    end
end
