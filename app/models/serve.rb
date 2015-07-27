# == Schema Information
#
# Table name: serves
#
#  id            :integer          not null, primary key
#  banner_id     :integer
#  campaign_id   :integer
#  click_id      :integer
#  conversion_id :integer
#  revenue       :decimal(15, 10)
#

class Serve < ActiveRecord::Base
  include Servable

  def self.top_serves(campaign:)
    top_serves = top_serves_by_revenue(campaign: campaign)[0...10]

    # BannerChooser.new(top_serves, )
    # top_serves += top_serves_by_clicks(campaign: campaign, limit: limit - top_serves.count) if top_serves.count < limit

    # top_serves += top_serves_by_impressions(campaign: campaign, limit: limit - top_serves.count) if top_serves.count < limit

    top_serves
  end
end
