class CreateSchedulePlans < ActiveRecord::Migration
  def change
    create_table :schedule_plans do |t|
      t.datetime :start_date
      t.integer :doctor_id

      t.timestamps
    end
  end
end
