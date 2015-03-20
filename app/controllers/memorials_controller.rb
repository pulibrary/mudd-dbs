class MemorialsController < ApplicationController
  before_action :set_memorial, only: [:show, :edit, :update, :destroy]

  # GET /memorials
  # GET /memorials.json
  def index
    if params
      @memorials = Memorial.search(params)
    else
      @memorials = Memorial.all
    end
  end

  # GET /memorials/1
  # GET /memorials/1.json
  def show
  end

  # GET /memorials/new
  def new
    @memorial = Memorial.new
  end

  # GET /memorials/1/edit
  def edit
  end

  # POST /memorials
  # POST /memorials.json
  def create
    @memorial = Memorial.new(memorial_params)

    respond_to do |format|
      if @memorial.save
        format.html { redirect_to @memorial, notice: 'Memorial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @memorial }
      else
        format.html { render action: 'new' }
        format.json { render json: @memorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memorials/1
  # PATCH/PUT /memorials/1.json
  def update
    respond_to do |format|
      if @memorial.update(memorial_params)
        format.html { redirect_to @memorial, notice: 'Memorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @memorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memorials/1
  # DELETE /memorials/1.json
  def destroy
    @memorial.destroy
    respond_to do |format|
      format.html { redirect_to memorials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memorial
      @memorial = Memorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memorial_params
      params.require(:memorial).permit(:publication, :volume, :no, :publish_date, :type, :subject, :class_year, :class_grade, :page)
    end
end
