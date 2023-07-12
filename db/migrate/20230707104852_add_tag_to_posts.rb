class AddTagToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :tag, :string, default: [], array: true 
  end
end
