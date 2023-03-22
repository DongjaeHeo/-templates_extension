class Category < ApplicationRecord
  DEFAULT_NAME = 'Uncategorized'
  attr_accessor :destroyed_by_parent

  belongs_to :user
  has_many :templates, dependent: :destroy

  validates :title, presence: true

  before_destroy :can_update_or_destroy?
  before_update :can_update_or_destroy?

  def default?
    title == DEFAULT_NAME
  end

  def can_update_or_destroy?
    if !destroyed_by_parent && default?
      self.errors[:base] << ["Cannot update or destroy category if name is #{DEFAULT_NAME}"]
      throw :abort
    end
  end
end
