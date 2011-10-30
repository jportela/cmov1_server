class SchedulePlan < ActiveRecord::Base
  has_many :schedules
  belongs_to :doctor
      
  def self.get_updated(time = "")
    if (!time || time.empty?)
      return SchedulePlan.all
    else
      return SchedulePlan.where("updated_at > ?", time.to_datetime.advance(:hours => -1))
    end
  end
  
end
