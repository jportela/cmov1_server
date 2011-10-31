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
end
