class CreateBloodGlucoses < ActiveRecord::Migration[5.0]
  def change
    create_table :blood_glucoses do |t|
      t.integer :level
      t.date :check_up_date
      t.references :user

      t.timestamps
    end
  end
end
