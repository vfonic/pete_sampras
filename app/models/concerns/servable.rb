module Servable
  extend ActiveSupport::Concern

  module ClassMethods
    def top_serves_by_revenue(campaign:, limit: 10)
      where(campaign_id: campaign).group(:banner_id, :id)
        .select('SUM(revenue) AS sum_revenue, serves.*')
        .order('sum_revenue desc NULLS LAST')
        .to_a
        # .limit(limit)
        # .where('revenue IS NOT NULL')
    end

    def top_serves_by_clicks(campaign:, limit: 5)
      where(campaign_id: campaign).group(:banner_id, :id)
        .where(revenue: nil)
        .select('SUM(revenue) AS sum_revenue, serves.*')
        .order('sum_revenue desc NULLS LAST')
        .to_a
        # .limit(limit)
    end

    def top_serves_by_impressions(campaign:, limit: 5)
      where(campaign_id: campaign).group(:banner_id, :id)
        .where('revenue IS NOT NULL')
        .select('SUM(revenue) AS sum_revenue, serves.*')
        .order('sum_revenue desc NULLS LAST')
        .to_a
        # .limit(limit)
    end
  end
end
