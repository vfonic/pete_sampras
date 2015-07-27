# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  image_name :string
#

require 'rails_helper'

describe Banner, type: :model do
  it { should have_many(:impressions) }
  it { should have_many(:clicks) }
  it { should have_many(:conversions).through(:clicks) }
  it { should have_many(:campaigns).through(:clicks) }
  it { should have_many(:impression_campaigns).through(:impressions).source(:campaign) }

  # x = amount of banners with conversions within a campaign
  # scenario      | requirements
  # x > 10        | Show the Top 10 banners based on revenue within that campaign
  # 5 < x <= 10   | Show the Top x banners based on revenue within that campaign
  # 0 < x <= 5    | Your collection of banners should consist of 5 banners, containing:
  #               | - The top x banners based on revenue within that campaign 
  #               | - banners with the most clicks within that campaign to make up a collection
  #               |   of 5 unique banners when needed
  # x == 0        | Show the top-5 banners based on clicks.
  #               | If the amount of banners with clicks are less than 5 within that campaign,
  #               | then you should add random banners to make up a collection of 5 unique banners.

  # campaign_id (test data)
  # 1 (11 conversions)
  let(:campaign_id_with_more_than_10_conversions) { 1 }
  let(:banner_with_highest_revenue) { 111 }

  # 2 (8 conversions), 3 (5 conversions + 3 clicks)
  let(:campaign_id_with_more_than_5_conversions) { 2 }
  let(:number_of_conversions) { 8 }
  let(:campaign_id_with_5_conversions) { 3 }

  # 4 (4 conversions + 1 click), 5 (1 conversion + 2 clicks + 2 impressions)
  let(:campaign_id_with_5_conversions_and_1_click) { 4 }
  let(:campaign_id_with_1_conversion_and_2_clicks_and_2_impressions) { 5 }

  # 6 (6 impressions), 7 (3 impressions)
  let(:campaign_id_with_6_impressions) { 6 }
  let(:campaign_id_with_3_impresions) { 7 }
  let(:number_of_banner_impressions) { 3 }

  # 8 (1 conversion, click and impression banner)
  let(:campaign_id_with_1_conversion_click_and_impression) { 8 }
  let(:single_banner_id) { 144 }

  describe ".top_banners" do
    it "should return top 10 banners based on revenue within given campaign" do
      banners = Banner.top_banners(campaign: campaign_id_with_more_than_10_conversions)

      expect(banners.count).to eq 10
      expect(banners.first.id).to eq banner_with_highest_revenue
    end

    it "should return top x banners based on revenue when 5 < x <= 10" do
      banners = Banner.top_banners(campaign: campaign_id_with_more_than_5_conversions)

      expect(banners.count).to eq number_of_conversions
    end

    it "should return top 5 banners based on revenue when x == 5" do
      banners = Banner.top_banners(campaign: campaign_id_with_5_conversions)

      expect(banners.count).to eq 5
    end

    it "should return top 5 banners based on revenue, clicks and impressions" do
      banners = Banner.top_banners(campaign: campaign_id_with_1_conversion_and_2_clicks_and_2_impressions)

      expect(banners.count).to eq 5
    end

    it "should return selection of 5 banners from impressions" do
      banners = Banner.top_banners(campaign: campaign_id_with_6_impressions)

      expect(banners.count).to eq 5
    end

    it "should return all banners from impressions if number of banners is less than 5" do
      banners = Banner.top_banners(campaign: campaign_id_with_3_impresions)

      expect(banners.count).to eq number_of_banner_impressions
    end

    it "should return a single banner when only one banner has multiple conversions and clicks" do
      banners = Banner.top_banners(campaign: campaign_id_with_1_conversion_click_and_impression)

      expect(banners.count).to eq 1
      expect(banners.first.id).to eq single_banner_id
    end
  end
end
