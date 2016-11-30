class OsDebTecnicosController < ApplicationController
  before_action :set_os_deb_tecnico, only: [:show, :edit, :update, :destroy]

  # GET /os_deb_tecnicos
  # GET /os_deb_tecnicos.json
  def index
    @os_deb_tecnicos = OsDebTecnico.all
  end

  # GET /os_deb_tecnicos/1
  # GET /os_deb_tecnicos/1.json
  def show
  end

  # GET /os_deb_tecnicos/new
  def new
    ordem_servico  = OrdemServico.find(params[:os_id])
    @os_deb_tecnico = OsDebTecnico.new
    @os_deb_tecnico.ordem_servico= ordem_servico

  end

  # GET /os_deb_tecnicos/1/edit
  def edit
  end

  # POST /os_deb_tecnicos
  # POST /os_deb_tecnicos.json
  def create
    @os_deb_tecnico = OsDebTecnico.new(os_deb_tecnico_params)

    respond_to do |format|
      if @os_deb_tecnico.save
        format.html { redirect_to @os_deb_tecnico, notice: 'Os deb tecnico was successfully created.' }
        format.json { render :show, status: :created, location: @os_deb_tecnico }
      else
        format.html { render :new }
        format.json { render json: @os_deb_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_deb_tecnicos/1
  # PATCH/PUT /os_deb_tecnicos/1.json
  def update
    respond_to do |format|
      if @os_deb_tecnico.update(os_deb_tecnico_params)
        format.html { redirect_to @os_deb_tecnico, notice: 'Os deb tecnico was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_deb_tecnico }
      else
        format.html { render :edit }
        format.json { render json: @os_deb_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_deb_tecnicos/1
  # DELETE /os_deb_tecnicos/1.json
  def destroy
    @os_deb_tecnico.destroy
    respond_to do |format|
      format.html { redirect_to os_deb_tecnicos_url, notice: 'Os deb tecnico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_deb_tecnico
      @os_deb_tecnico = OsDebTecnico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_deb_tecnico_params
      params.require(:os_deb_tecnico).permit(:debt_id, :os_id)
    end
end
