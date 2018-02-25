class CreateRestaurantOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_opinions do |t|

      t.timestamps
    end
  end
end
