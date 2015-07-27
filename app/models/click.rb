# == Schema Information
#
# Table name: clicks
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

class Click < ActiveRecord::Base
  belongs_to :banner
  belongs_to :campaign
  has_one :conversion
end
