class CampaignsController < ApplicationController
  before_action :set_campaign, only: :show

  def show
  end

  private
    def set_campaign
      # campaign/banner selection logic here
      # @serves = BannerChooser.top_banners(campaign: params[:campaign_id])
      @serves = Serve.top_serves(campaign: params[:campaign_id])
    end
end
