# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  image_name :string
#

FactoryGirl.define do
  factory :banner do
    image_path "MyString"
  end
end
