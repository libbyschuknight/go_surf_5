class CreateSurfSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :surf_spots do |t|
      t.string  :name
      t.string  :description
      t.string  :place
      t.string  :region
      t.string  :country
      t.float   :latitude
      t.float   :longitude
      t.integer :stoke_rating
      
      t.timestamps
    end
  end
end
