class TemplatesController < ApplicationController
  before_action :set_template, only: %i[edit update destroy]

  def new
    @template = Template.new
    @category = Category.find(params[:category_id])
  end

  def create
    @template = Template.new(template_params)
    @category = Category.find(params[:category_id])
    @template.category = @category
    if @template.save
      redirect_to workspace_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    @category = Category.find(params[:category_id])
    @template.category = @category
    if @template.update(template_params)
      redirect_to workspace_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @template.destroy

    redirect_to workspace_path, status: :see_other
  end


  private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:title, :content)
  end
end
