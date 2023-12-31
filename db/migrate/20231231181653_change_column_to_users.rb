class ChangeColumnToUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :image, :text, limit: 4294967295
  end

  def down
    change_column :users, :image, :text
  end
end
