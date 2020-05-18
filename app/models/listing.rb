class Listing < ApplicationRecord
  belongs_to :user
  enum lams: { Yes: 0, No: 1 }
  validates :title, :manufacturer, :model, :style, :price, :location, :mileage, :lams, :description, :engine, :year, presence: true
  has_one :manufacturer
  has_one :style
  has_one :location
  has_one_attached :picture
end
