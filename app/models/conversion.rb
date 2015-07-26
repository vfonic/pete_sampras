class Conversion < ActiveRecord::Base
  delegate :campaign, :to => :click, :allow_nil => true
  delegate :banner, :to => :click, :allow_nil => true
  belongs_to :click
end
