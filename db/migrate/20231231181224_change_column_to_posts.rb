class ChangeColumnToPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :posts, :image, :text, null: false, limit: 4294967295
  end

  def down
    change_column :posts, :image, :text, null: false
  end
end
