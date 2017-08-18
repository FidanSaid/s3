class AddOriginalFileNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :original_file_name, :string
  end
end
