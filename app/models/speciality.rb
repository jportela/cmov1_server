class Speciality < ActiveRecord::Base
  
  def self.get_updated(time = "")
    if (time.empty?)
      return Speciality.all
    else
      return Speciality.where("updated_at > ?", time.to_datetime)
    end
  end
  
end
