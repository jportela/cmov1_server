class ChangeScheduleToStartEndDates < ActiveRecord::Migration
  def up
    change_table :schedules do |t|
      t.remove :date, :start_date, :end_date
      t.datetime :start_date
      t.datetime :end_date
    end
  end

  def down
    change_table :schedules do |t|
      t.remove :start_date, :end_date
      t.datetime :date 
      t.string :start_date 
      t.string :end_date
    end
  end
end
