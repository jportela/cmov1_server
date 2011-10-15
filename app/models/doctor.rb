class Doctor < ActiveRecord::Base
  def self.get_specialities
    Speciality.all.map { |sp| [sp.name, sp.id] }
  end
  
  def speciality
    Speciality.find_by_id(self.speciality_id)
  end
end
