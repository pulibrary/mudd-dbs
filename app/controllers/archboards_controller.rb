class ArchboardsController < ApplicationController
  before_action :set_archboard, only: [:show, :edit, :update, :destroy]

  # GET /archboards
  # GET /archboards.json
  def index
    if !params[:subject1].blank?
      @archboards = Archboard.search(params).page(params[:page])
    else
      @archboards = Archboard.all.page(params[:page])
    end
  end

  # GET /archboards/1
  # GET /archboards/1.json
  def show
  end

  # GET /archboards/new
  def new
    @archboard = Archboard.new
  end

  # GET /archboards/1/edit
  def edit
  end

  # POST /archboards
  # POST /archboards.json
  def create
    @archboard = Archboard.new(archboard_params)

    respond_to do |format|
      if @archboard.save
        format.html { redirect_to @archboard, notice: 'Archboard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @archboard }
      else
        format.html { render action: 'new' }
        format.json { render json: @archboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archboards/1
  # PATCH/PUT /archboards/1.json
  def update
    respond_to do |format|
      if @archboard.update(archboard_params)
        format.html { redirect_to @archboard, notice: 'Archboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @archboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archboards/1
  # DELETE /archboards/1.json
  def destroy
    @archboard.destroy
    respond_to do |format|
      format.html { redirect_to archboards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archboard
      @archboard = Archboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archboard_params
      params.require(:archboard).permit(:numbers_assigned, :original_assigned, :building_info_sheet, :drawing_title, :drawing_number, :project_type, :drawing_type, :board_date, :board_dimensions, :color, :drawing_view, :elevation, :comments, :contractor1_type, :contractor1_name, :contractor2_type, :contractor2_name, :contractor3_type, :contractor3_name, :proposal, :not_constructed, :bw_fiche)
    end
end
