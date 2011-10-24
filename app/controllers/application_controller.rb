class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # GET /system/time.json
  def system_time
    respond_to do |format|
      format.json { render json: { :time => Time.now } }
    end
  end
end
