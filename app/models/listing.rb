class Listing < ApplicationRecord
  belongs_to :user
  validates :title, :manufacturer, :model, :style, :price, :location, :mileage, :lams, :description, :engine, :year, presence: true
  has_one_attached :picture
end
