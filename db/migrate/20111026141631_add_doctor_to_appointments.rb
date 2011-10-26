class AddDoctorToAppointments < ActiveRecord::Migration
  def up
      change_table :appointments do |t|
        t.integer :doctor_id
      end
    end
    def down
      remove_column :appointments, :doctor_id
    end
end
