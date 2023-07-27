class AddFirstTagToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :first_tag, :text
  end
end
