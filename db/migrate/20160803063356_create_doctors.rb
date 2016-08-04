class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :second_name
      t.string :gender
      t.string :city
      t.string :area
      t.string :speciality
      t.string :consultaion_charges
      t.string :degree
      t.string :experience
      t.string :clinic_name
      t.timestamps
    end
  end
end
