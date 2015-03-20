class NassauLiteraturesController < ApplicationController
  before_action :set_nassau_literature, only: [:show, :edit, :update, :destroy]

  # GET /nassau_literatures
  # GET /nassau_literatures.json
  def index
    if params
      @nassau_literatures = NassauLiterature.search(params).page(params[:page])
    else
      @nassau_literatures = NassauLiterature.all.page(params[:page])
    end
  end

  # GET /nassau_literatures/1
  # GET /nassau_literatures/1.json
  def show
  end

  # GET /nassau_literatures/new
  def new
    @nassau_literature = NassauLiterature.new
  end

  # GET /nassau_literatures/1/edit
  def edit
  end

  # POST /nassau_literatures
  # POST /nassau_literatures.json
  def create
    @nassau_literature = NassauLiterature.new(nassau_literature_params)

    respond_to do |format|
      if @nassau_literature.save
        format.html { redirect_to @nassau_literature, notice: 'Nassau literature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nassau_literature }
      else
        format.html { render action: 'new' }
        format.json { render json: @nassau_literature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nassau_literatures/1
  # PATCH/PUT /nassau_literatures/1.json
  def update
    respond_to do |format|
      if @nassau_literature.update(nassau_literature_params)
        format.html { redirect_to @nassau_literature, notice: 'Nassau literature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nassau_literature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nassau_literatures/1
  # DELETE /nassau_literatures/1.json
  def destroy
    @nassau_literature.destroy
    respond_to do |format|
      format.html { redirect_to nassau_literatures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nassau_literature
      @nassau_literature = NassauLiterature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nassau_literature_params
      params.require(:nassau_literature).permit(:lname, :fname, :classyear, :title, :date, :issue_no, :pages)
    end
end
