class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :templates, through: :categories
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :create_default_category
  before_destroy :set_destroyed_by_parent, prepend: true
  acts_as_token_authenticatable
  def create_default_category
    @category = Category.create(title: Category::DEFAULT_NAME, user: self)
    Template.create(title: "Generic Happy Birthday", category: @category, content: "<div>Hello, and a very <strong>happy birtday to you</strong>! I'm wishing you all the best for the day - how are you celebrating? Let's meet up soon, drinks are on me! Lots of love x</div>")
  end

  def set_destroyed_by_parent
    categories.each do |cat|
      cat.destroyed_by_parent = true
    end
  end
end
