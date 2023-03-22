class Template < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true
  has_rich_text :content
end
