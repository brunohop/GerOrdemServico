class OrdemServicosController < ApplicationController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy]

  # GET /ordem_servicos
  # GET /ordem_servicos.json
  def index
    @ordem_servicos = OrdemServico.all
  end

  # GET /ordem_servicos/1
  # GET /ordem_servicos/1.json
  def show
  end

  # GET /ordem_servicos/new
  def new
    @pessoas = Pessoa.all
    @ordem_servico = OrdemServico.new
  end

  # GET /ordem_servicos/1/edit
  def edit
  end

  # POST /ordem_servicos
  # POST /ordem_servicos.json
  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    respond_to do |format|
      if @ordem_servico.save
        format.html { redirect_to @ordem_servico, notice: 'Ordem servico was successfully created.' }
        format.json { render :show, status: :created, location: @ordem_servico }
      else
        format.html { render :new }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordem_servicos/1
  # PATCH/PUT /ordem_servicos/1.json
  def update
    respond_to do |format|
      if @ordem_servico.update(ordem_servico_params)
        format.html { redirect_to @ordem_servico, notice: 'Ordem servico was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordem_servico }
      else
        format.html { render :edit }
        format.json { render json: @ordem_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordem_servicos/1
  # DELETE /ordem_servicos/1.json
  def destroy
    @ordem_servico.destroy
    respond_to do |format|
      format.html { redirect_to ordem_servicos_url, notice: 'Ordem servico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordem_servico
      @ordem_servico = OrdemServico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordem_servico_params
      params.require(:ordem_servico).permit(:fiscal_contrato_id, :projeto_id, :preposto_id, :resp_tecnico_id, :nome, :data_inicio, :data_previsao, :data_fim, :situacao, :resp_requisitante_id, :tipo_os_id, :fator_atendimento, :ust_pago, :ust_glosa)
    end
end
