class EntregavelsController < ApplicationController
  before_action :set_entregavel, only: [:show, :edit, :update, :destroy]

  # GET /entregavels
  # GET /entregavels.json
  def index
    @entregavels = Entregavel.all
  end

  # GET /entregavels/1
  # GET /entregavels/1.json
  def show
  end

  # GET /entregavels/new
  def new
    @entregavel = Entregavel.new
  end

  # GET /entregavels/1/edit
  def edit
  end

  # POST /entregavels
  # POST /entregavels.json
  def create
    @entregavel = Entregavel.new(entregavel_params)

    respond_to do |format|
      if @entregavel.save
        format.html { redirect_to @entregavel, notice: 'Entregavel was successfully created.' }
        format.json { render :show, status: :created, location: @entregavel }
      else
        format.html { render :new }
        format.json { render json: @entregavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entregavels/1
  # PATCH/PUT /entregavels/1.json
  def update
    respond_to do |format|
      if @entregavel.update(entregavel_params)
        format.html { redirect_to @entregavel, notice: 'Entregavel was successfully updated.' }
        format.json { render :show, status: :ok, location: @entregavel }
      else
        format.html { render :edit }
        format.json { render json: @entregavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entregavels/1
  # DELETE /entregavels/1.json
  def destroy
    @entregavel.destroy
    respond_to do |format|
      format.html { redirect_to entregavels_url, notice: 'Entregavel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entregavel
      @entregavel = Entregavel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entregavel_params
      params.require(:entregavel).permit(:nome, :ativo)
    end
end
