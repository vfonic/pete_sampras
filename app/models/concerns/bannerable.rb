module Bannerable
  extend ActiveSupport::Concern

  module ClassMethods
      def top_banners(campaign:)
      banners = top_banners_by_revenue(campaign: campaign)[0...10]

      if banners.count < 5
        banners |= top_banners_by_clicks(campaign: campaign)
        banners = banners[0...5]
      end

      if banners.count < 5
        banners |= impression_banners(campaign: campaign)
        banners = banners[0...5]
      end

      banners
    end

    def top_banners_by_revenue(campaign:)
      select('banners.*, SUM(conversions.revenue) AS sum_revenue').joins(:conversions)
        .where('clicks.campaign_id = ?', campaign)
        .group(:id)
        .order('sum_revenue DESC')
        .to_a
    end

    def top_banners_by_clicks(campaign:)
      select('banners.*, COUNT(clicks.*) AS count_clicks')
        .joins(:clicks)
        .where('clicks.campaign_id = ?', campaign)
        .group(:id)
        .order('count_clicks DESC')
        .to_a
    end

    def impression_banners(campaign:)
      Campaign.find(campaign).impression_banners
    end
  end
end
