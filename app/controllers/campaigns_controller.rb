class CampaignsController < ApplicationController
  before_action :set_banner, only: :show

  layout false

  def show
  end

  private
    def set_banner
      # campaign/banner selection logic here
      banners_hash = session[params[:campaign_id]]
      banners_hash = set_session_banners(campaign: params[:campaign_id]) unless banners_hash && banners_hash["banner_ids"].present?

      banner_ids = banners_hash["banner_ids"]

      banner_id = banner_ids.shift
      session[params[:campaign_id]]["banner_ids"] = banner_ids

      @banner = Banner.find(banner_id)
    end

    def set_session_banners(campaign:)
      banners = Banner.top_banners(campaign: campaign)
      banners.shuffle!
      session[campaign] = { "banner_ids" => banners.map(&:id) }
      session[campaign]
    end
end
