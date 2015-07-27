# == Schema Information
#
# Table name: campaigns
#
#  id :integer          not null, primary key
#

class Campaign < ActiveRecord::Base
  has_many :impressions
  has_many :clicks
  has_many :conversions, through: :clicks
  has_many :banners, through: :clicks
  has_many :impression_banners, through: :impressions, source: :banner
end
