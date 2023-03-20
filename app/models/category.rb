class Category < ApplicationRecord
  belongs_to :user
  has_many :templates

  validates :title, presence: true
end
