class OsEntregavelsController < ApplicationController
  before_action :set_os_entregavel, only: [:show, :edit, :update, :destroy]

  # GET /os_entregavels
  # GET /os_entregavels.json
  def index
    @os_entregavels = OsEntregavel.all
  end

  # GET /os_entregavels/1
  # GET /os_entregavels/1.json
  def show
  end

  # GET /os_entregavels/new
  def new
    @os_entregavel = OsEntregavel.new
  end

  # GET /os_entregavels/1/edit
  def edit
  end

  # POST /os_entregavels
  # POST /os_entregavels.json
  def create
    @os_entregavel = OsEntregavel.new(os_entregavel_params)

    respond_to do |format|
      if @os_entregavel.save
        format.html { redirect_to @os_entregavel, notice: 'Os entregavel was successfully created.' }
        format.json { render :show, status: :created, location: @os_entregavel }
      else
        format.html { render :new }
        format.json { render json: @os_entregavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_entregavels/1
  # PATCH/PUT /os_entregavels/1.json
  def update
    respond_to do |format|
      if @os_entregavel.update(os_entregavel_params)
        format.html { redirect_to @os_entregavel, notice: 'Os entregavel was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_entregavel }
      else
        format.html { render :edit }
        format.json { render json: @os_entregavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_entregavels/1
  # DELETE /os_entregavels/1.json
  def destroy
    @os_entregavel.destroy
    respond_to do |format|
      format.html { redirect_to os_entregavels_url, notice: 'Os entregavel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_entregavel
      @os_entregavel = OsEntregavel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_entregavel_params
      params.require(:os_entregavel).permit(:entregavel_id, :osi_d, :ust_previsto)
    end
end
