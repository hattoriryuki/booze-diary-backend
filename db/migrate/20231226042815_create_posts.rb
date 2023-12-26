class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :quantity
      t.string :price
      t.integer :recommend, null: false
      t.text :image, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
