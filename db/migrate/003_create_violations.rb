class CreateViolations < ActiveRecord::Migration

  def change
    create_table :violations do |t|
      t.string :date
      t.string :code
      t.string :severity_level
      t.string :description
      t.integer :inspection_id
    end
  end

end