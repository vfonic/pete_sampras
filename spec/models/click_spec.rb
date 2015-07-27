# == Schema Information
#
# Table name: clicks
#
#  id          :integer          not null, primary key
#  banner_id   :integer
#  campaign_id :integer
#

require 'rails_helper'

describe Click, type: :model do
  it { should belong_to(:banner) }
  it { should belong_to(:campaign) }
  it { should have_one(:conversion) }

end
