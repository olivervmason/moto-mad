class Listing < ApplicationRecord
  belongs_to :user
  enum lams: { Yes: 0, No: 1 }
  validates :title, :manufacturer_id, :location_id, :style_id, :price, :model, :mileage, :lams, :description, :engine, :year, presence: true
  belongs_to :manufacturer
  belongs_to :style
  belongs_to :location
  has_one_attached :picture
end
