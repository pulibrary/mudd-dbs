class AudioVisualsController < ApplicationController
  before_action :set_audio_visual, only: [:show, :edit, :update, :destroy]

  # GET /audio_visuals
  # GET /audio_visuals.json
  def index
    if params
      @audio_visuals = AudioVisual.search(params).page(params[:page])
    else
      @audio_visuals = AudioVisual.all.page(params[:page])
    end
  end

  # GET /audio_visuals/1
  # GET /audio_visuals/1.json
  def show
  end

  # GET /audio_visuals/new
  def new
    @audio_visual = AudioVisual.new
  end

  # GET /audio_visuals/1/edit
  def edit
  end

  # POST /audio_visuals
  # POST /audio_visuals.json
  def create
    @audio_visual = AudioVisual.new(audio_visual_params)

    respond_to do |format|
      if @audio_visual.save
        format.html { redirect_to @audio_visual, notice: 'Audio visual was successfully created.' }
        format.json { render action: 'show', status: :created, location: @audio_visual }
      else
        format.html { render action: 'new' }
        format.json { render json: @audio_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_visuals/1
  # PATCH/PUT /audio_visuals/1.json
  def update
    respond_to do |format|
      if @audio_visual.update(audio_visual_params)
        format.html { redirect_to @audio_visual, notice: 'Audio visual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @audio_visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_visuals/1
  # DELETE /audio_visuals/1.json
  def destroy
    @audio_visual.destroy
    respond_to do |format|
      format.html { redirect_to audio_visuals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_visual
      @audio_visual = AudioVisual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_visual_params
      params.require(:audio_visual).permit(:item, :box, :topic, :title, :creator, :year, :format, :color, :duration, :copied, :notes, :id3, :index)
    end
end
