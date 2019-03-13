class AddAddressToScooters < ActiveRecord::Migration[5.2]
  def change
    add_column :scooters, :address, :string
  end
end
