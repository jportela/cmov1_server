class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # GET /system/time.json
  def system_time
    respond_to do |format|
      format.json { render json: { :time => Time.now } }
    end
  end
  
  def system_auth
    user = params[:user]
    pass = params[:pass]
    
    a = Doctor.find_by_username(user)
    if a
      type = "doctor"
    else
      a = Patient.find_by_username(user)
      if (a)
        type = "patient"
      end
    end 
    
    if (not a or a.password_md5 != pass)
      logged = "false"
      a = nil
    else
      logged = "true"
    end
    respond_to do |format|
      format.json { render json: { type: type, object: a, logged: logged } }
    end
  end
  
  def system_stats
    patient_appointments_count = 0
    patient_with_most_appointments = nil
    Patient.all.each { |p|
      c = p.appointments.count
      if (c > patient_appointments_count) 
        patient_appointments_count = c
        patient_with_most_appointments = p
      end
    }
    
    doctor_appointments_count = 0
    doctor_with_most_appointments = nil
    Doctor.all.each { |d|
      c = d.appointments.count
      if (c > doctor_appointments_count) 
        doctor_appointments_count = c
        doctor_with_most_appointments = d
      end
    }
    
    num_appointments = Appointment.count
    
    respond_to do |format|
      format.json { render json: { patient: patient_with_most_appointments, doctor: doctor_with_most_appointments,
                                   patient_count: patient_appointments_count, doctor_count: doctor_appointments_count,
                                   appointments_count: num_appointments } }
    end
    
  end
end
