class Template < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  has_rich_text :content
end
