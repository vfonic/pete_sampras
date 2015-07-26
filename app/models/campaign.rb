class Campaign < ActiveRecord::Base
  has_many :impressions
  has_many :clicks
  has_many :conversions, through: :clicks
  has_many :banners, through: :clicks
end
