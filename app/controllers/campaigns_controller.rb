class CampaignsController < ApplicationController
  before_action :set_campaign, only: :show

  def show
  end

  private
    def set_campaign
      # campaign/banner selection logic here
      @banners = Banner.top_banners(campaign: params[:campaign_id])
    end
end
