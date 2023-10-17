class OrginfosController < ApplicationController
  before_action :set_orginfo, only: %i[ show edit update destroy ]

  # GET /orginfos or /orginfos.json
  def index
    @orginfos = Orginfo.all
  end

  # GET /orginfos/1 or /orginfos/1.json
  def show
  end

  # GET /orginfos/new
  def new
    @orginfo = Orginfo.new
  end

  # GET /orginfos/1/edit
  def edit
  end

  # POST /orginfos or /orginfos.json
  def create
    @orginfo = Orginfo.new(orginfo_params)

    respond_to do |format|
      if @orginfo.save
        format.html do
 redirect_to(orginfo_url(@orginfo), notice: "Orginfo was successfully created.")
        end
        format.json { render(:show, status: :created, location: @orginfo) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @orginfo.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /orginfos/1 or /orginfos/1.json
  def update
    respond_to do |format|
      if @orginfo.update(orginfo_params)
        format.html do
 redirect_to(orginfo_url(@orginfo), notice: "Orginfo was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @orginfo) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @orginfo.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /orginfos/1 or /orginfos/1.json
  def destroy
    @orginfo.destroy

    respond_to do |format|
      format.html { redirect_to(orginfos_url, notice: "Orginfo was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orginfo
      @orginfo = Orginfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orginfo_params
      params.require(:orginfo).permit(:title, :description, :image, :file)
    end
end
