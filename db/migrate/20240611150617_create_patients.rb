class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.text :address
      t.string :phone
      t.date :registered_on

      t.timestamps
    end
  end
end
