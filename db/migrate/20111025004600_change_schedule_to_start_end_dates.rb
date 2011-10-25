class ChangeScheduleToStartEndDates < ActiveRecord::Migration
  def up
    drop_table :schedules
    create_table :schedules do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :schedule_plan_id

      t.timestamps
    end
  end

  def down
    drop_table :schedules
    create_table :schedules do |t|
      t.datetime :date
      t.string :start_hour
      t.string :end_hour
      t.integer :schedule_plan_id

      t.timestamps
    end
  end
end
