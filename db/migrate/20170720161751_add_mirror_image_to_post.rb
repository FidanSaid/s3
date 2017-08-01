class AddMirrorImageToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :mirror_image, :string
  end
end
