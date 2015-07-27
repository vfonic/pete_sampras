class CampaignsController < ApplicationController
  before_action :set_banner, only: :show

  layout false

  def show
  end

  private
    def set_banner
      # campaign/banner selection logic here
      campaign = session[params[:campaign_id]]
      campaign = set_session_banners(params) if campaign.blank?

      campaign = campaign.with_indifferent_access

      banner_ids = campaign[:banner_ids]

      if banner_ids.blank?
        campaign = set_session_banners(params)
        banner_ids = campaign[:banner_ids]
      end

      banner_id = banner_ids.shift
      @banner = Banner.find(banner_id)
      session[params[:campaign_id]][:banner_ids] = banner_ids

      @banner_ids = banner_ids
    end

    def set_session_banners(params)
      banners = Banner.top_banners(campaign: params[:campaign_id])
      banners.shuffle!
      session[params[:campaign_id]] = { banner_ids: banners.map(&:id) }
      session[params[:campaign_id]]
    end
end
