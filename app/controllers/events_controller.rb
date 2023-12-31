class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    if params[:search_query].present?
      @search_query = params[:search_query]
      @events = Event.where('event_name LIKE ?', "%#{@search_query}%").paginate(
        page: params[:page], per_page: 10
      )
    else
      @events = case params[:sort_by]

                when 'created_at_asc'
        Event.order(created_at: :asc).paginate(page: params[:page], per_page: 7)
                when 'created_at_desc'
        Event.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
                when 'date_asc'
        Event.order(start_time: :asc).paginate(page: params[:page], per_page: 7)
                when 'date_desc'
        Event.order(start_time: :desc).paginate(page: params[:page], per_page: 7)
                when 'event_name_asc'
        Event.order(event_name: :asc).paginate(page: params[:page], per_page: 7)
                when 'event_name_desc'
        Event.order(event_name: :desc).paginate(page: params[:page], per_page: 7)
                else
        Event.order(id: :desc).paginate(page: params[:page], per_page: 7)
                end
    end
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
    if params[:search_query].present?
      @search_query = params[:search_query]
      @events = Event.where('event_name LIKE ?', "%#{@search_query}%").paginate(
        page: params[:page], per_page: 10
      )
    else
      @events = case params[:sort_by]
        
                when 'date_asc'
        Event.order(start_time: :asc).paginate(page: params[:page], per_page: 7)
                when 'date_desc'
        Event.order(start_time: :desc).paginate(page: params[:page], per_page: 7)
                when 'event_name_asc'
        Event.order(event_name: :asc).paginate(page: params[:page], per_page: 7)
                when 'event_name_desc'
        Event.order(event_name: :desc).paginate(page: params[:page], per_page: 7)
                else
        Event.order(id: :desc).paginate(page: params[:page], per_page: 7)
                end
    end

    user_email = current_admin.email
    @user = Member.find_by(email: user_email)

  end

  def member_show
    @event = Event.find(params[:id])
  end


  def duplicate_event
    @event = Event.new
    @old_event = Event.find(params[:id])
    @event.event_name = @old_event.event_name
    @event.location = @old_event.location
    @event.start_time = @old_event.start_time
    @event.end_time = @old_event.end_time
    @event.description = @old_event.description
    @event.password = @old_event.password
  end
  
  
  def duplicate_event_create
    @duplicating_event = params[:event][:duplicate]
    @event = Event.new(event_params)
  
    
  
  
    respond_to do |format|
      if @event.save
        if (@duplicating_event == "true")
          puts "Duplicated event!"
          format.html { redirect_to( duplicate_event_event_path(@event), notice: "Event was successfully created. \n Created duplicate.") }
        else
          puts "Did not duplicate event"
          format.html { redirect_to(event_url(@event), notice: "Event was successfully created.") }
          format.json { render(:show, status: :created, location: @event) }
        end
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
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
    @duplicating_event = false
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @duplicating_event = params[:event][:duplicate]
    # @duplicating_event = false
    @event = Event.new(event_params)


    


    respond_to do |format|
      if @event.save
        if (@duplicating_event == "true")
          puts "Duplicated event!"
          puts @duplicating_event
          format.html { redirect_to( duplicate_event_event_path(@event), notice: "Event was successfully created. \n Created duplicate.") }
          # format.json { render(:show, status: :created, location: @event) }
        else
          puts "Did not duplicate event"
          format.html { redirect_to(event_url(@event), notice: "Event was successfully created.") }
          format.json { render(:show, status: :created, location: @event) }
        end
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    @duplicating_event = params[:event][:duplicate]
    respond_to do |format|
      if @event.update(event_params)
        if (@duplicating_event == "true")
          puts "Duplicated event!"
          format.html { redirect_to( duplicate_event_event_path(@event), notice: "Event was successfully created. \n Created duplicate.") }
          # format.json { render(:show, status: :created, location: @event) }
        else
          puts "Did not duplicate event"
          format.html { redirect_to(event_url(@event), notice: "Event was successfully updated.") }
          format.json { render(:show, status: :created, location: @event) }
        end
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

