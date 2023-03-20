class WorkspacesController < ApplicationController
  def show
    @categories = current_user.categories
    @category = Category.new
  end
end
