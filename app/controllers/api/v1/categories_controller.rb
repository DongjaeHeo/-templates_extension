class Api::V1::CategoriesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [:index]
  def index
    @categories = policy_scope(Category).select { |category| category.user == current_user }
  end
end
