class PendingMembersController < ApplicationController
  before_action :set_pending_member, only: %i[show edit update destroy]

  # GET /pending_members or /pending_members.json
  def index
    @pending_members = PendingMember.all
  end

  # GET /pending_members/1 or /pending_members/1.json
  def show; end

  # GET /pending_members/new
  def new
    @pending_member = PendingMember.new
  end

  # GET /pending_members/1/edit
  def edit; end

  # POST /pending_members or /pending_members.json
  def create
    @pending_member = PendingMember.new(pending_member_params)

    respond_to do |format|
      if @pending_member.save
        format.html do
          redirect_to(new_admin_session_url, notice: "Pending member was successfully created.")
        end
        format.json { render(:show, status: :created, location: @pending_member) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @pending_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /pending_members/1 or /pending_members/1.json
  def update
    respond_to do |format|
      if @pending_member.update(pending_member_params)
        format.html do
          redirect_to(pending_member_url(@pending_member), 
                      notice: "Pending member was successfully updated."
                     )
        end
        format.json { render(:show, status: :ok, location: @pending_member) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @pending_member.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /pending_members/1 or /pending_members/1.json
  def destroy
    @pending_member.destroy!

    respond_to do |format|
      format.html do
        redirect_to(pending_members_url, notice: "Pending member was successfully destroyed.")
      end
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pending_member
    @pending_member = PendingMember.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pending_member_params
    params.require(:pending_member).permit(:first_name, :preferred_name, :last_name, :email)
  end
end
