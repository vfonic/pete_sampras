class CampaignsController < ApplicationController
  before_action :set_banner, only: :show

  def show
  end

  private
    def set_banner
      # campaign/banner selection logic here
      banner_ids = session[:banner_ids]

      if banner_ids.blank?
        banners = Banner.top_banners(campaign: params[:campaign_id])
        banners.shuffle!
        session[:banner_ids] = banners.map(&:id)
        banner_ids = session[:banner_ids]
      end

      banner_id = banner_ids.shift
      @banner = Banner.find(banner_id)
    end
end
