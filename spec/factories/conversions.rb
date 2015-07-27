# == Schema Information
#
# Table name: conversions
#
#  id       :integer          not null, primary key
#  click_id :integer
#  revenue  :decimal(15, 10)
#

FactoryGirl.define do
  factory :conversion do
    click_id 1
    revenue "9.99"
  end
end
