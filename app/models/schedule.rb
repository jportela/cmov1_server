class Schedule < ActiveRecord::Base
  belongs_to :schedule_plan
  has_one :appointment
  
  def self.get_updated(time = "")
    if (!time || time.empty?)
      return Schedule.all
    else
      return Schedule.where("updated_at > ?", time.to_datetime.advance(:hours => -1))
    end
  end
  
end
gg