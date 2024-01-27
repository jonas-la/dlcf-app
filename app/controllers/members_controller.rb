class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json

  
  def index
    @members = Member.all   

    if params[:sort_by] == 'first_name'
      @members = @members.order(:first_name)
    end
    if params[:sort_by] == 'preferred_name'
      @members = @members.order(:preferred_name)
    end
    if params[:sort_by] == 'last_name'
      @members = @members.order(:last_name)
    end
    if params[:sort_by] == 'email'
      @members = @members.order(:email)
    end
    if params[:sort_by] == 'role'
      @members = @members.order(:role)
    end
  end

  # GET /members/1 or /members/1.json
  def show
    # gets the events the member attended 
    # (suprisingly easy, though it required 
    # a minor update to the models tell ruby 
    # about the relationship)
    @events_attended = @member.events
    # makes it an empty list if it is null
    # (it shouldn't ever be, but still)
    @events_attended ||= [] 
    @events_attended = @events_attended.order(start_time: :desc)
  end

  # GET /members/new
  def new
    @member = Member.new

  end

  def new_account
    @member = Member.new
    @pending_member = if OmniAuth.config.test_mode == false
      PendingMember.find(params[:p_id])
                      else
      PendingMember.new
                      end

  end

  def create_account
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html do
 redirect_to(pending_members_path, notice: "Member was successfully created.")
        end
        format.json { render(:show, status: :created, location: @member) }
        to_delete = PendingMember.find_by(email: member_params[:email])
        to_delete.destroy
      else
        format.html { render(:new_account, status: :unprocessable_entity) }
        format.json { render(json: @member.errors, status: :unprocessable_entity) }
      end
    end

  end

  # GET /members/1/edit
  def edit
    
  end

  # GET /members/1/edit
  def edit_account
   
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to(member_url(@member), notice: "Member was successfully created.") }
        format.json { render(:show, status: :created, location: @member) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to(member_url(@member), notice: "Member was successfully updated.") }
        format.json { render(:show, status: :ok, location: @member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @member.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update_account
    params.require(:member).permit(:is_member)
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)

    respond_to do |format|
      if @user.update(member_params)
        format.html do
 redirect_to(member_dashboard_index_path, notice: "Member was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @user) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
  
    if @member.destroy
      respond_to do |format|
        format.html { redirect_to(members_url, notice: "Member was successfully destroyed.") }
        format.json { head(:no_content) }
      end
    else
      # Can't delete dclftest@gmail.com account
      # Can't delete dlcftest@gmail.com account
      # Yes the emails are different 
      respond_to do |format|
        format.html { redirect_to(members_url, notice: "This account can't be destroyed.") }
        format.json { head(:no_content) }
      end
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:first_name, :preferred_name, :last_name, :email, :is_member, 
                                     :is_admin, :bio, :contact, :photo_file_name, :role
      )
    end
end
