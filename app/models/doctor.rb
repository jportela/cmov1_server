class Doctor < ActiveRecord::Base
  belongs_to :speciality
  has_many :appointments
  has_many :patients, :through => :appointments
  has_many :schedule_plans
  
  def self.get_specialities
    Speciality.all.map { |sp| [sp.name, sp.id] }
  end
  
  def speciality
    Speciality.find_by_id(self.speciality_id)
  end
  
  def self.get_updated(time = "")
    if (!time || time.empty?)
      return Doctor.all
    else
      return Doctor.where("updated_at > ?", time.to_datetime.advance(:hours => -1))
    end
  end
  
  def get_future_appointments
    appointments = self.appointments
    future_appointments = []
    appointments.each { |ap|
      (future_appointments << ap) unless (ap.schedule.end_date < Time.now)
    }
    return future_appointments
  end
end
