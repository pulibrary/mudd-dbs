class TrusteesController < ApplicationController
  before_action :set_trustee, only: [:show, :edit, :update, :destroy]

  # GET /trustees
  # GET /trustees.json
  def index
    if params
      @trustees = Trustee.search(params)
    else
      @trustees = Trustee.all
    end
  end

  # GET /trustees/1
  # GET /trustees/1.json
  def show
  end

  # GET /trustees/new
  def new
    @trustee = Trustee.new
  end

  # GET /trustees/1/edit
  def edit
  end

  # POST /trustees
  # POST /trustees.json
  def create
    @trustee = Trustee.new(trustee_params)

    respond_to do |format|
      if @trustee.save
        format.html { redirect_to @trustee, notice: 'Trustee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trustee }
      else
        format.html { render action: 'new' }
        format.json { render json: @trustee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trustees/1
  # PATCH/PUT /trustees/1.json
  def update
    respond_to do |format|
      if @trustee.update(trustee_params)
        format.html { redirect_to @trustee, notice: 'Trustee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trustee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trustees/1
  # DELETE /trustees/1.json
  def destroy
    @trustee.destroy
    respond_to do |format|
      format.html { redirect_to trustees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trustee
      @trustee = Trustee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trustee_params
      params.require(:trustee).permit(:access_id, :full_name, :trustee_type, :dates_of_service, :university_status, :first_year)
    end
end
