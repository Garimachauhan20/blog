class CreateNestedForms < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_forms do |t|
      t.text :input
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
