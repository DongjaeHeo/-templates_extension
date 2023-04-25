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
    Template.create(title: "How to change the templates shortcut command", category: @category, content: "<div><!--block-->1. Click the three dots expansion menu in the upper right corner of Google Chrome.<br>2. Open the More Tools menu.<br>3. Select Extensions.<br>4. In the upper left corner, click on the icon with 3 lines and select Keyboard Shortcuts.<br>5. Find the Templates extension and click edit icon on 'Content on the current page'<br>6. Press a combination of “Ctrl” or “Ctrl + Shift” and any other available key.</div>")
    Template.create(title: "How to use the Templates Extension", category: @category, content: '<div><!--block-->Access your templates anywhere<br>A chrome extension allowing you to import and create personalised templates for use at any time, on any website. Access saved templates with a click. Simply copy and paste, anywhere on the web. <br><br>Seamlessly integrated and accessible, Templates Extension is a simple method to boost efficiency, productivity and success.<br><br>Check out how: <a href="https://www.youtube.com/watch?v=Ws7npou5FiU">https://www.youtube.com/watch?v=Ws7npou5FiU</a><br><br>Step by step:<br>1. Visit Chrome webstore and download the extension <a href="https://chrome.google.com/webstore/detail/templates-extension/nnhakomnddfejmblgloopplchcadglhi/related?hl=en&amp;authuser=0">https://chrome.google.com/webstore/detail/templates-extension/nnhakomnddfejmblgloopplchcadglhi/related?hl=en&amp;authuser=0</a><br>2. Within your workplace create or import your own templates and format as desired<br>3. Whilst surfing the web, feel free to access your templates at any time<br>4. Press Ctrl+Shift+Y (Command+Shift+Y) to bring up your templates<br>5. Click<br>6. and paste!</div>')
  end

  def set_destroyed_by_parent
    categories.each do |cat|
      cat.destroyed_by_parent = true
    end
  end
end
