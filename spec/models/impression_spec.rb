# == Schema Information
#
# Table name: impressions
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

require 'rails_helper'

describe Impression, type: :model do
  it { should belong_to(:banner) }
  it { should belong_to(:campaign) }
end
