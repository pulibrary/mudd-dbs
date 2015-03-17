class MemorabiliaController < ApplicationController
  before_action :set_memorabilium, only: [:show, :edit, :update, :destroy]

  # GET /memorabilia
  # GET /memorabilia.json
  def index
    if params
      @memorabilia = Memorabilium.search(params)
    else
      @memorabilia = Memorabilium.all
    end
  end

  # GET /memorabilia/1
  # GET /memorabilia/1.json
  def show
  end

  # GET /memorabilia/new
  def new
    @memorabilium = Memorabilium.new
  end

  # GET /memorabilia/1/edit
  def edit
  end

  # POST /memorabilia
  # POST /memorabilia.json
  def create
    @memorabilium = Memorabilium.new(memorabilium_params)

    respond_to do |format|
      if @memorabilium.save
        format.html { redirect_to @memorabilium, notice: 'Memorabilium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @memorabilium }
      else
        format.html { render action: 'new' }
        format.json { render json: @memorabilium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memorabilia/1
  # PATCH/PUT /memorabilia/1.json
  def update
    respond_to do |format|
      if @memorabilium.update(memorabilium_params)
        format.html { redirect_to @memorabilium, notice: 'Memorabilium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @memorabilium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memorabilia/1
  # DELETE /memorabilia/1.json
  def destroy
    @memorabilium.destroy
    respond_to do |format|
      format.html { redirect_to memorabilia_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memorabilium
      @memorabilium = Memorabilium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memorabilium_params
      params.require(:memorabilium).permit(:box, :category, :description, :classyear, :year, :reunion, :provenance)
    end
end
