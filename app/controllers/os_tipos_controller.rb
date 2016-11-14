class OsTiposController < ApplicationController
  before_action :set_os_tipo, only: [:show, :edit, :update, :destroy]

  # GET /os_tipos
  # GET /os_tipos.json
  def index
    @os_tipos = OsTipo.all
  end

  # GET /os_tipos/1
  # GET /os_tipos/1.json
  def show
  end

  # GET /os_tipos/new
  def new
    @os_tipo = OsTipo.new
  end

  # GET /os_tipos/1/edit
  def edit
  end

  # POST /os_tipos
  # POST /os_tipos.json
  def create
    @os_tipo = OsTipo.new(os_tipo_params)

    respond_to do |format|
      if @os_tipo.save
        format.html { redirect_to @os_tipo, notice: 'Os tipo was successfully created.' }
        format.json { render :show, status: :created, location: @os_tipo }
      else
        format.html { render :new }
        format.json { render json: @os_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_tipos/1
  # PATCH/PUT /os_tipos/1.json
  def update
    respond_to do |format|
      if @os_tipo.update(os_tipo_params)
        format.html { redirect_to @os_tipo, notice: 'Os tipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_tipo }
      else
        format.html { render :edit }
        format.json { render json: @os_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_tipos/1
  # DELETE /os_tipos/1.json
  def destroy
    @os_tipo.destroy
    respond_to do |format|
      format.html { redirect_to os_tipos_url, notice: 'Os tipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_tipo
      @os_tipo = OsTipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_tipo_params
      params.require(:os_tipo).permit(:os_tipo)
    end
end
