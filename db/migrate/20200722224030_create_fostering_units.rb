class CreateFosteringUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :fostering_units do |t|
      t.date :date
      t.float :price

      t.timestamps
    end
  end
end
