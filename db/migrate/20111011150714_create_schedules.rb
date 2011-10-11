class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.string :start_hour
      t.string :end_hour
      t.integer :schedule_plan_id

      t.timestamps
    end
  end
end
