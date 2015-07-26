class Click < ActiveRecord::Base
  belongs_to :banner
  belongs_to :campaign
  has_one :conversion
end
