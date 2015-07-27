# == Schema Information
#
# Table name: impressions
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

FactoryGirl.define do
  factory :impression do
    banner_id 1
    campaign_id 1
  end
end
