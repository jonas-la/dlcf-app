class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    # Rails.logger.debug(" - Debugging: @attendance index")
    @attendances = Attendance.all
    # @sorted_attendance = Attendance.joins(:event).order("events.start_time DESC")
    @attendances = @attendances.includes(:event).order("events.start_time DESC")
  end

  # GET /attendances/1 or /attendances/1.json
  def show
    # Rails.logger.debug(" - Dbugging: @attendance show")
    @attendance = Attendance.find(params[:id])
    # @user = Member.find_by(id: @attendance.member_id)
    # @event = Event.find_by(id: @attendance.event_id)
  end

  # GET /attendances/new
  def new
    # Rails.logger.debug(" - Debugging: @attendance new")
    @attendance = Attendance.new
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
    # @event = Event.find(params[:event_id])
  end

  # GET /attendances/ne2w
  def ne2w
    # Rails.logger.debug(" - Debugging: @attendance new2")
    @event = Event.find(params[:event])
    @attendance = Attendance.new

    @feedback = Feedback.new
    # @event = Event.find(params[:event_id])
  end

  # GET /attendances/1/edit
  def edit
    # Rails.logger.debug(" - Debugging: @attendance edit")
  end

  # POST /attendances or /attendances.json
  def create2
    # Rails.logger.debug(" - Debugging: @attendance create2!")
  
    # Check if a similar attendance record already exists
    existing_attendance = Attendance.find_by(
      member_id: attendance_params[:member_id],
      event_id: attendance_params[:event_id]
    )
  
    if existing_attendance
      # Handle the case when a duplicate attendance is detected
      respond_to do |format|
        format.html do
 redirect_to(event_path(attendance_params[:event_id]), 
             notice: "Attendance record already exists."
            )
        end
        format.json do
 render(json: { error: "Attendance record already exists" }, status: :unprocessable_entity)
        end
      end
    else
      @attendance = Attendance.new(
        member_id: attendance_params[:member_id], 
        event_id: attendance_params[:event_id], 
        attended: attendance_params[:attended]
      )
  
      respond_to do |format|
        if @attendance.save
          format.html do
 redirect_to(event_path(attendance_params[:event_id]), 
             notice: "#{Member.find(attendance_params[:member_id]).first_name} signed in."
            )
          end
          format.json { render(:show, status: :created, location: @attendance) }
        else
          format.html do
 redirect_to(event_path(attendance_params[:event_id]), notice: "Error signing in. Not valid")
          end
          format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
        end
      end
    end
  end  

  # POST /attendances or /attendances.json
  def create
    # Rails.logger.debug(" - Debugging: @attendance create")
    @event = Event.find(attendance_params[:event_id])
    @attendance = if attendance_params[:password] == @event.password
      Attendance.new(
        member_id: attendance_params[:member_id], 
        event_id: attendance_params[:event_id], 
        attended: attendance_params[:attended]
      )
                  else 
      Attendance.new
                  end

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to(member_index_events_path, notice: "Successfully signed in.") }
    
        format.json { render(:show, status: :created, location: @attendance) }
      else

        format.html { redirect_to(member_index_events_path, notice: "Error signing in. not valid") }
    
        # format.html { render :new, status: :unprocessable_entity }

        format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    # Rails.logger.debug("Debugging: @attendance update")
    @attendance = Attendance.find(params[:id])
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html do
 redirect_to(attendance_url(@attendance), notice: "Attendance was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @attendance) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    # Rails.logger.debug("Debugging: @attendance destroy")
    @attendance = Attendance.find(params[:id])
    event_id = @attendance.event_id
    @attendance.destroy

    respond_to do |format|
      format.html do
 redirect_to(event_path(event_id), notice: "Attendance was successfully destroyed.")
      end
      format.json { head(:no_content) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      # @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:member_id, :event_id, :attended, :password)
    end
end
