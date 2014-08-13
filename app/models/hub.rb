require "csv"

class Hub < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
  has_many :orders

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Hub.create! row.to_hash
    end
  end
end
