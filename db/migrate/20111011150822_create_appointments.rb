class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :schedule_id
      t.datetime :date

      t.timestamps
    end
  end
end
