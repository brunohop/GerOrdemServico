class OrdemServicosController < ApplicationController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy]



  def identificador_os
      "OS "+@ordem_servico.id.to_s+" - "+@ordem_servico.data_inicio.month.to_s+"/"+@ordem_servico.data_inicio.year.to_s+" - "+@ordem_servico.projeto.nome+" Sprint"+ @ordem_servico.sprint.to_s
  end
  helper_method :identificador_os

  # GET /ordem_servicos/1/imprimir
  def imprimir
      @ordem_servico = OrdemServico.find(params[:os_id])
      calcula_total()
      render "imprimir"
  end

  def calcula_total
    total_ust=0
    @ordem_servico.os_entregavels.each do |os_entregavel|
      if os_entregavel.ust_previsto
        total_ust =   total_ust + os_entregavel.ust_previsto
      end
    end
    @total_ust=total_ust
  end

  def calcula_total_ust_tarefas
    total_ust_tarefas=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if os_tarefa.ust_tarefa
            total_ust_tarefas =   total_ust_tarefas + os_tarefa.ust_tarefa
      end
    end
  @total_ust_tarefas=total_ust_tarefas
  end

  def calcula_total_horas_tarefas
    total_horas_tarefas=0
    @ordem_servico.os_tarefas.each do |os_tarefa|
      if os_tarefa.horastarefa
            total_horas_tarefas =   total_horas_tarefas + os_tarefa.horastarefa
      end
    end
  @total_horas_tarefas=total_horas_tarefas
  end


  # GET /ordem_servicos
  # GET /ordem_servicos.json
  def index
    @ordem_servicos = OrdemServico.all

  end

  # GET /ordem_servicos/1
  # GET /ordem_servicos/1.json
  def show
    total_ust=0
    calcula_total()
    calcula_total_ust_tarefas()
    calcula_total_horas_tarefas()
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
      params.require(:ordem_servico).permit(:fechamento, :observacoes, :fiscal_contrato_id, :projeto_id, :preposto_id, :resp_tecnico_id, :descricao, :sprint, :data_inicio, :data_previsao, :data_fim, :situacao, :resp_requisitante_id, :tipo_os_id, :fator_atendimento, :ust_pago, :ust_glosa)
    end
end
