class CreateInspections < ActiveRecord::Migration

  def change 
    create_table :inspections do |t|
      t.string :inspection_date
      t.string :inspection_type
      t.string :grade
      t.integer :score
      t.string :grade_date
      t.integer :restaurant_id
    end
  end

end