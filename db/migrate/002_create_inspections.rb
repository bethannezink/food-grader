class CreateInspections < ActiveRecord::Migration

  def change 
    create_table :inspections do |t|
      t.string :date
      t.string :grade
      t.integer :score
      t.string :violation_code
      t.string :violation_type
      t.string :violation_details
      t.integer :restaurant_id
    end
  end

end