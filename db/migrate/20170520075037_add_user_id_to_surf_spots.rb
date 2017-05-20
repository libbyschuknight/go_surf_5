class AddUserIdToSurfSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :surf_spots, :user_id, :integer
  end
end
