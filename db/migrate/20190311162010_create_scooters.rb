class CreateScooters < ActiveRecord::Migration[5.2]
  def change
    create_table :scooters do |t|
      t.string :image
      t.text :description
      t.string :license_plate
      t.string :model
      t.string :make
      t.integer :year
      t.float :price
      t.string :engine
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
