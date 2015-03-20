class WwiiMemorialsController < ApplicationController
  before_action :set_wwii_memorial, only: [:show, :edit, :update, :destroy]

  # GET /wwii_memorials
  # GET /wwii_memorials.json
  def index
    if params
      @wwii_memorials = WwiiMemorial.search(params)
    else
      @wwii_memorials = WwiiMemorial.all
    end
  end

  # GET /wwii_memorials/1
  # GET /wwii_memorials/1.json
  def show
  end

  # GET /wwii_memorials/new
  def new
    @wwii_memorial = WwiiMemorial.new
  end

  # GET /wwii_memorials/1/edit
  def edit
  end

  # POST /wwii_memorials
  # POST /wwii_memorials.json
  def create
    @wwii_memorial = WwiiMemorial.new(wwii_memorial_params)

    respond_to do |format|
      if @wwii_memorial.save
        format.html { redirect_to @wwii_memorial, notice: 'Wwii memorial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wwii_memorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @wwii_memorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wwii_memorials/1
  # PATCH/PUT /wwii_memorials/1.json
  def update
    respond_to do |format|
      if @wwii_memorial.update(wwii_memorial_params)
        format.html { redirect_to @wwii_memorial, notice: 'Wwii memorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wwii_memorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wwii_memorials/1
  # DELETE /wwii_memorials/1.json
  def destroy
    @wwii_memorial.destroy
    respond_to do |format|
      format.html { redirect_to wwii_memorials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wwii_memorial
      @wwii_memorial = WwiiMemorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wwii_memorial_params
      params.require(:wwii_memorial).permit(:access_id, :rank, :name, :death_date, :place, :year, :death_year, :last_name)
    end
end
