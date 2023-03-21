class TemplatesController < ApplicationController
  before_action :set_template, only: %i[edit update destroy]

  def new
    @template = Template.new
    @category = Category.find(params[:category_id])
  end

  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to workspace_path }
        format.turbo_stream # look in views/templates/create.turbo_stream.erb
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to workspace_path, notice: "Template is successfully updated"}
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream
      end

    end
    # if @template.update(template_params)
    #   redirect_to workspace_path
    # else
    #   render :edit, status: :unprocessable_entity
    # end
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
    params.require(:template).permit(:title, :content, :category_id)
  end
end
