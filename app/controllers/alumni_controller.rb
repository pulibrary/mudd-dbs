class AlumniController < ApplicationController
  before_action :set_alumn, only: [:show, :edit, :update, :destroy]

  # GET /alumni
  # GET /alumni.json
  def index
    if params
      @alumni = Alumn.search(params).page(params[:page])
    else
      @alumni = Alumn.all.page(params[:page])
    end
  end

  # GET /alumni/1
  # GET /alumni/1.json
  def show
  end

  # GET /alumni/new
  def new
    @alumn = Alumn.new
  end

  # GET /alumni/1/edit
  def edit
  end

  # POST /alumni
  # POST /alumni.json
  def create
    @alumn = Alumn.new(alumn_params)

    respond_to do |format|
      if @alumn.save
        format.html { redirect_to @alumn, notice: 'Alumn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alumn }
      else
        format.html { render action: 'new' }
        format.json { render json: @alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumni/1
  # PATCH/PUT /alumni/1.json
  def update
    respond_to do |format|
      if @alumn.update(alumn_params)
        format.html { redirect_to @alumn, notice: 'Alumn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumni/1
  # DELETE /alumni/1.json
  def destroy
    @alumn.destroy
    respond_to do |format|
      format.html { redirect_to alumni_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumn
      @alumn = Alumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumn_params
      params.require(:alumn).permit(:box, :lname, :fname, :class, :graduate, :photos, :oversize)
    end
end
