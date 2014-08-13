require "csv"

class Order < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
  belongs_to :hub

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Order.create! row.to_hash
    end
  end
end
