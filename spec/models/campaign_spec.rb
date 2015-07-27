# == Schema Information
#
# Table name: campaigns
#
#  id :integer          not null, primary key
#

require 'rails_helper'

describe Campaign, type: :model do
  it { should have_many(:impressions) }
  it { should have_many(:clicks) }
  it { should have_many(:conversions).through(:clicks) }
  it { should have_many(:banners).through(:clicks) }
  it { should have_many(:impression_banners).through(:impressions).source(:banner) }
end
