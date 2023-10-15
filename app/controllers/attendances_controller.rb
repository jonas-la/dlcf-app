class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
    # @sorted_attendance = Attendance.joins(:event).order("events.start_time DESC")
    @attendances = @attendances.includes(:event).order("events.start_time DESC")

  end

  # GET /attendances/1 or /attendances/1.json
  def show
    #@user = Member.find_by(id: @attendance.member_id)
    #@event = Event.find_by(id: @attendance.event_id)
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
    #@event = Event.find(params[:event_id])
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @event = Event.find(attendance_params[:event_id])
    if attendance_params[:password] == @event.password
      @attendance = Attendance.new(
        member_id: attendance_params[:member_id], 
        event_id: attendance_params[:event_id], 
        attended: attendance_params[:attended])
    else 
      @attendance = Attendance.new()
    end

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to member_index_events_path, notice: "Successfully signed in." }
    
        # format.html { redirect_to member_dashboard_index_path(@attendance), notice: "Attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
      else

        format.html { redirect_to member_index_events_path, notice: "Error signing in. not valid" }
    
        # format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:member_id, :event_id, :attended, :password)
    end
end
