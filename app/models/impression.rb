class Impression < ActiveRecord::Base
  belongs_to :banner
  belongs_to :campaign
end
