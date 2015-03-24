class TrusteesMinutesController < ApplicationController
  before_action :set_trustees_minute, only: [:show, :edit, :update, :destroy]

  # GET /trustees_minutes
  # GET /trustees_minutes.json
  def index
    if !params[:subject1].blank?
      @trustees_minutes = TrusteesMinute.search(params).page(params[:page])
    else
      @trustees_minutes = TrusteesMinute.all.page(params[:page])
    end
  end

  # GET /trustees_minutes/1
  # GET /trustees_minutes/1.json
  def show
  end

  # GET /trustees_minutes/new
  def new
    @trustees_minute = TrusteesMinute.new
  end

  # GET /trustees_minutes/1/edit
  def edit
  end

  # POST /trustees_minutes
  # POST /trustees_minutes.json
  def create
    @trustees_minute = TrusteesMinute.new(trustees_minute_params)

    respond_to do |format|
      if @trustees_minute.save
        format.html { redirect_to @trustees_minute, notice: 'Trustees minute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trustees_minute }
      else
        format.html { render action: 'new' }
        format.json { render json: @trustees_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trustees_minutes/1
  # PATCH/PUT /trustees_minutes/1.json
  def update
    respond_to do |format|
      if @trustees_minute.update(trustees_minute_params)
        format.html { redirect_to @trustees_minute, notice: 'Trustees minute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trustees_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trustees_minutes/1
  # DELETE /trustees_minutes/1.json
  def destroy
    @trustees_minute.destroy
    respond_to do |format|
      format.html { redirect_to trustees_minutes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trustees_minute
      @trustees_minute = TrusteesMinute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trustees_minute_params
      params.require(:trustees_minute).permit(:access_id, :subject, :volume, :page)
    end
end
