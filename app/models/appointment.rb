class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :schedule
  
  scope :future, joins(:schedule).where("schedules.end_date > ?", Time.now).order("schedules.start_date")
end
