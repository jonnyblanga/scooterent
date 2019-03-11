class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :address, :string
    add_column :users, :license_photo, :string
  end
end
