# == Schema Information
#
# Table name: clicks
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

FactoryGirl.define do
  factory :click do
    banner_id 1
    campaign_id 1
  end
end
