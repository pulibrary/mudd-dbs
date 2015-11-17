class RecentAlumniController < ApplicationController
  before_action :set_recent_alumn, only: [:show, :edit, :update, :destroy]

  # GET /recent_alumni
  # GET /recent_alumni.json
  def index
    if params
      @recent_alumni = RecentAlumn.search(params).page(params[:page])
    else
      @recent_alumni = RecentAlumn.all.page(params[:page])
    end
  end

  # GET /recent_alumni/1
  # GET /recent_alumni/1.json
  def show
  end

  # GET /recent_alumni/new
  def new
    @recent_alumn = RecentAlumn.new
  end

  # GET /recent_alumni/1/edit
  def edit
  end

  # POST /recent_alumni
  # POST /recent_alumni.json
  def create
    @recent_alumn = RecentAlumn.new(recent_alumn_params)

    respond_to do |format|
      if @recent_alumn.save
        format.html { redirect_to @recent_alumn, notice: 'Recent alumn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recent_alumn }
      else
        format.html { render action: 'new' }
        format.json { render json: @recent_alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recent_alumni/1
  # PATCH/PUT /recent_alumni/1.json
  def update
    respond_to do |format|
      if @recent_alumn.update(recent_alumn_params)
        format.html { redirect_to @recent_alumn, notice: 'Recent alumn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recent_alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recent_alumni/1
  # DELETE /recent_alumni/1.json
  def destroy
    @recent_alumn.destroy
    respond_to do |format|
      format.html { redirect_to recent_alumni_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recent_alumn
      @recent_alumn = RecentAlumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recent_alumn_params
      params.require(:recent_alumn).permit(:lname, :fname, :year, :pubfile, :academicfile)
    end
end
