class CreateRestaurants < ActiveRecord::Migration

  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :restaurant_style
      t.string :borough
    end
  end


end