# == Schema Information
#
# Table name: conversions
#
#  id       :integer          not null, primary key
#  click_id :integer
#  revenue  :decimal(15, 10)
#

class Conversion < ActiveRecord::Base
  delegate :campaign, :to => :click, :allow_nil => true
  delegate :banner, :to => :click, :allow_nil => true
  belongs_to :click
end
