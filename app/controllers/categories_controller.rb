class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to workspace_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @user = User.find(@category.user_id)
    if @category.update(category_params)
      redirect_to workspace_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to workspace_path, status: :see_other
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
