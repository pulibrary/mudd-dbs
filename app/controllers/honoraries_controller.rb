class HonorariesController < ApplicationController
  before_action :set_honorary, only: [:show, :edit, :update, :destroy]

  # GET /honoraries
  # GET /honoraries.json
  def index
    if params
      @honoraries = Honorary.search(params).page(params[:page])
    else
      @honoraries = Honorary.all.page(params[:page])
    end
  end

  # GET /honoraries/1
  # GET /honoraries/1.json
  def show
  end

  # GET /honoraries/new
  def new
    @honorary = Honorary.new
  end

  # GET /honoraries/1/edit
  def edit
  end

  # POST /honoraries
  # POST /honoraries.json
  def create
    @honorary = Honorary.new(honorary_params)

    respond_to do |format|
      if @honorary.save
        format.html { redirect_to @honorary, notice: 'Honorary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @honorary }
      else
        format.html { render action: 'new' }
        format.json { render json: @honorary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /honoraries/1
  # PATCH/PUT /honoraries/1.json
  def update
    respond_to do |format|
      if @honorary.update(honorary_params)
        format.html { redirect_to @honorary, notice: 'Honorary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @honorary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /honoraries/1
  # DELETE /honoraries/1.json
  def destroy
    @honorary.destroy
    respond_to do |format|
      format.html { redirect_to honoraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_honorary
      @honorary = Honorary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def honorary_params
      params.require(:honorary).permit(:lname, :fname, :year, :death, :degree, :file)
    end
end
