class DoctorsController < ApplicationController
  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @doctors.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @doctor.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @doctor.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /doctors/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :json => @doctor.to_json(:except => [:created_at, :updated_at]), status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :ok }
    end
  end
  
  def specialities    
    respond_to do |format|
      format.json { render :json => Speciality.all.to_json(:except => [:created_at, :updated_at]) }
    end
  end
  
  def update_doctors
    
  end
  
  def updated_specialities
      to_update = Speciality.get_updated(params[:time])
    respond_to do |format|
      format.json { render :json => to_update.to_json(:except => [:created_at, :updated_at]) }
    end
  end
  
  def updated
      to_update = Doctor.get_updated(params[:time])
    respond_to do |format|
      format.json { render :json => to_update.to_json(:except => [:created_at, :updated_at]) }
    end
  end
  
  def appointments
    doctor = Doctor.find(params[:id])
    appointments = doctor.appointments.future
    respond_to do |format|
      format.json { render :json => appointments.to_json(:except => [:created_at, :updated_at]) }
    end
  end
  
  def current_plan
     doctor = Doctor.find(params[:id])
     plan = doctor.schedule_plans.where("start_date < ?", Time.now).order("start_date DESC").first
     respond_to do |format|
       format.json { render :json => plan.to_json(:except => [:created_at, :updated_at]) }
     end
   end
   
   def current_plans
      doctor = Doctor.find(params[:id])
      plans = doctor.schedule_plans.where("start_date >= ?", Time.now).order("start_date DESC") 
      plans << doctor.schedule_plans.where("start_date < ?", Time.now).order("start_date DESC").first
      respond_to do |format|
        format.json { render :json => plans.to_json(:except => [:created_at, :updated_at]) }
      end
    end
    
    def furthest_appointment
      doctor = Doctor.find(params[:id])
      app = doctor.appointments.order("date DESC").first
      respond_to do |format|
        format.json { render :json => app.to_json(:except => [:created_at, :updated_at]) }
      end
    end
  
  def stats 
    doctor = Doctor.find(params[:id])
    array = doctor.appointments.group("patient").count 
    patient_appointments_count = 0
    patient_with_most_appointments = nil
    
    array.each { |k,v|
      if v > patient_appointments_count
        patient_appointments_count = v
        patient_with_most_appointments = k
      end
    }
    
    array = doctor.appointments.group_by { |t| t.date.month.to_s + "-" + t.date.year.to_s }
    
    months_appointments = []
    months = []
    array.each {|k,v| 
      months_appointments << v.count
      months << k
    }
    
    
    respond_to do |format|
      format.json { render json: { months: months, months_apps: months_appointments, patient: patient_with_most_appointments,
                                   patient_count: patient_appointments_count } }
    end
  end
  
end
