class AddApprovedToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :approved, :boolean, default: false
  end
end
