class RenameContentToTextInTemplates < ActiveRecord::Migration[7.0]
  def change
    rename_column :templates, :content, :text
  end
end
