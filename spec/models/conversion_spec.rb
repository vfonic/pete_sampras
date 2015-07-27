# == Schema Information
#
# Table name: conversions
#
#  id       :integer          not null, primary key
#  click_id :integer
#  revenue  :decimal(15, 10)
#

require 'rails_helper'

RSpec.describe Conversion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
