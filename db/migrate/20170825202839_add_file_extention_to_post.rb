class AddFileExtentionToPost < ActiveRecord::Migration[5.1]
  def change
  	 add_column :posts, :file_extention, :string
  end
end
