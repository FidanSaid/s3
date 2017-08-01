class AddGenerateFileNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :generated_file_name, :string
  end
end
