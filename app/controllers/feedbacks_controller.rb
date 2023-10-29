class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[ show edit update destroy ]

  # GET /feedbacks or /feedbacks.json
  def index
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)

    @feedbacks = case params[:sort_by]

                 when 'satisfaction_asc'
      Feedback.order(satisfaction: :asc).paginate(page: params[:page], per_page: 7)
                 when 'satisfaction_desc'
      Feedback.order(satisfaction: :desc).paginate(page: params[:page], per_page: 7)
                 else
      Feedback.order(id: :desc).paginate(page: params[:page], per_page: 7)
                 end
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
  def create
    user_email = current_admin.email
    @user = Member.find_by(email: user_email)
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html do
 redirect_to(feedback_url(@feedback), notice: "Feedback was successfully created.")
        end
        format.json { render(:show, status: :created, location: @feedback) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @feedback.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html do
 redirect_to(feedback_url(@feedback), notice: "Feedback was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @feedback) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @feedback.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to(feedbacks_url, notice: "Feedback was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:satisfaction, :critiques, :new_ideas, :member_id)
    end
end
