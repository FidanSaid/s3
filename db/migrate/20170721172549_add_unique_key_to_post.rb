class AddUniqueKeyToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :unique_key, :string
  end
end
