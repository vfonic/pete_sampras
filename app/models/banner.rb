# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  image_name :string
#

class Banner < ActiveRecord::Base
  has_many :impressions
  has_many :clicks
  has_many :conversions, through: :clicks
  has_many :campaigns, through: :clicks
  has_many :impression_campaigns, through: :impressions, source: :campaign

  include Bannerable
end
