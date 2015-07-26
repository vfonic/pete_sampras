class Banner < ActiveRecord::Base
  has_many :impressions
  has_many :clicks
  has_many :conversions, through: :clicks
  has_many :campaigns, through: :clicks
end
