class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @attendees_raw = Attendance.where(event_id: params[:id])
    
    # @attendees_main = []
    # @attendees_raw.each do |attendee|
    #   attendee_name = Member.find_by(id: attendee.member_id.to_i)
    #   @attendees_main << attendee_name
    # end

  end

  def member_index
    # render("member_index")
    @events = Event.all

    user_email = current_admin.email
    @user = Member.find_by(email: user_email)

  end

  def member_show
    @event = Event.find(params[:id])
  end

  def schedule_show
    @event = Event.find(params[:id])
  end

  def event_schedule
    @events = Event.where('start_time > ?', DateTime.now).limit(10)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to(event_url(@event), notice: "Event was successfully created.") }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to(event_url(@event), notice: "Event was successfully updated.") }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url, notice: "Event was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_name, :location, :start_time, :end_time, :description, 
                                    :password
      )
    end
end
