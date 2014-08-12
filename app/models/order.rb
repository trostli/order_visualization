class Order < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
  belongs_to :hub
end
