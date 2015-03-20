class NewAlumniController < ApplicationController
  before_action :set_new_alumn, only: [:show, :edit, :update, :destroy]

  # GET /new_alumni
  # GET /new_alumni.json
  def index
    if params
      @new_alumni = NewAlumn.search(params).page(params[:page])
    else
      @new_alumni = NewAlumn.all.page(params[:page])
    end
  end

  # GET /new_alumni/1
  # GET /new_alumni/1.json
  def show
  end

  # GET /new_alumni/new
  def new
    @new_alumn = NewAlumn.new
  end

  # GET /new_alumni/1/edit
  def edit
  end

  # POST /new_alumni
  # POST /new_alumni.json
  def create
    @new_alumn = NewAlumn.new(new_alumn_params)

    respond_to do |format|
      if @new_alumn.save
        format.html { redirect_to @new_alumn, notice: 'New alumn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_alumn }
      else
        format.html { render action: 'new' }
        format.json { render json: @new_alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_alumni/1
  # PATCH/PUT /new_alumni/1.json
  def update
    respond_to do |format|
      if @new_alumn.update(new_alumn_params)
        format.html { redirect_to @new_alumn, notice: 'New alumn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @new_alumn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_alumni/1
  # DELETE /new_alumni/1.json
  def destroy
    @new_alumn.destroy
    respond_to do |format|
      format.html { redirect_to new_alumni_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_alumn
      @new_alumn = NewAlumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_alumn_params
      params.require(:new_alumn).permit(:lname, :fname, :year, :pubfile, :academicfile)
    end
end
