class Hub < ActiveRecord::base
  validates :latitude, :longitude, presence: true
  has_many :orders
end
