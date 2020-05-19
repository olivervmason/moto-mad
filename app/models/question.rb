class Question < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_many :answers, dependent: :destroy
end
