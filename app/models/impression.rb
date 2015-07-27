# == Schema Information
#
# Table name: impressions
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

class Impression < ActiveRecord::Base
  belongs_to :banner
  belongs_to :campaign
end
