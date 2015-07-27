# == Schema Information
#
# Table name: conversions
#
#  id       :integer          not null, primary key
#  click_id :integer
#  revenue  :decimal(15, 10)
#

require 'rails_helper'

describe Conversion, type: :model do
  it { should belong_to(:click) }
  it { should delegate_method(:campaign).to(:click) }
  it { should delegate_method(:banner).to(:click) }
end
