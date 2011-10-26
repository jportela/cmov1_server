class Speciality < ActiveRecord::Base
  has_many :doctors
  def self.get_updated(time = "")
    if (!time || time.empty?)
      return Speciality.all
    else
      return Speciality.where("updated_at > ?", time.to_datetime.advance(:hours => -1))
    end
  end
  
end
