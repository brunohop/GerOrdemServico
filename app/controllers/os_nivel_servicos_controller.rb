class OsNivelServicosController < ApplicationController
  before_action :set_os_nivel_servico, only: [:show, :edit, :update, :destroy]

  # GET /os_nivel_servicos
  # GET /os_nivel_servicos.json
  def index
    @os_nivel_servicos = OsNivelServico.all
  end

  # GET /os_nivel_servicos/1
  # GET /os_nivel_servicos/1.json
  def show
  end

  # GET /os_nivel_servicos/new
  def new
    ordem_servico  = OrdemServico.find(params[:os_id])
    @os_nivel_servico = OsNivelServico.new
    @os_nivel_servico.ordem_servico= ordem_servico
  end

  # GET /os_nivel_servicos/1/edit
  def edit
  end

  # POST /os_nivel_servicos
  # POST /os_nivel_servicos.json
  def create
    @os_nivel_servico = OsNivelServico.new(os_nivel_servico_params)

    respond_to do |format|
      if @os_nivel_servico.save
        format.html { redirect_to @os_nivel_servico, notice: 'Os nivel servico was successfully created.' }
        format.json { render :show, status: :created, location: @os_nivel_servico }
      else
        format.html { render :new }
        format.json { render json: @os_nivel_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_nivel_servicos/1
  # PATCH/PUT /os_nivel_servicos/1.json
  def update
    respond_to do |format|
      if @os_nivel_servico.update(os_nivel_servico_params)
        format.html { redirect_to @os_nivel_servico, notice: 'Os nivel servico was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_nivel_servico }
      else
        format.html { render :edit }
        format.json { render json: @os_nivel_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_nivel_servicos/1
  # DELETE /os_nivel_servicos/1.json
  def destroy
    @os_nivel_servico.destroy
    respond_to do |format|
      format.html { redirect_to os_nivel_servicos_url, notice: 'Os nivel servico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_nivel_servico
      @os_nivel_servico = OsNivelServico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_nivel_servico_params
      params.require(:os_nivel_servico).permit(:os_id, :nivel_servico, :indicador)
    end
end
