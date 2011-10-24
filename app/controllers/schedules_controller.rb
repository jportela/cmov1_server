class SchedulesController < ApplicationController
  # GET /schedules_plan/1/schedules
  # GET /schedules_plan/1/schedules.json
  def index
    @schedule_plan = SchedulePlan.find(params[:schedule_plan_id])
    @schedules = @schedule_plan.schedules

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @schedules.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /schedules_plan/1/schedules/1
  # GET /schedules_plan/1/schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @schedule.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /schedules_plan/1/schedules/new
  # GET /schedules_plan/1/schedules/new.json
  def new
    @schedule = Schedule.new
    @schedule_plan = SchedulePlan.find(params[:schedule_plan_id]) 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @schedule.to_json(:except => [:created_at, :updated_at]) }
    end
  end

  # GET /schedules_plan/1/schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
    @schedule_plan = SchedulePlan.find(params[:schedule_plan_id]) 
  end

  # POST /schedules_plan/1/schedules
  # POST /schedules_plan/1/schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])
    @schedule.schedule_plan = SchedulePlan.find(params[:schedule_plan_id]) unless @schedule.schedule_plan
    
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedule_plan_schedule_path(@schedule.schedule_plan.id, @schedule.id), notice: 'Schedule was successfully created.' }
        format.json { render :json => @schedule.to_json(:except => [:created_at, :updated_at]), status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules_plan/1/schedules/1
  # PUT /schedules_plan/1/schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to schedule_plan_schedule_path(@schedule.schedule_plan.id, @schedule.id), notice: 'Schedule was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules_plan/1/schedules/1
  # DELETE /schedules_plan/1/schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedule_plan_schedules_url (params[:schedule_plan_id])}
      format.json { head :ok }
    end
  end
end
