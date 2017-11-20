class OsTarefasController < ApplicationController
  before_action :set_os_tarefa, only: [:show, :edit, :update, :destroy]

  # GET /os_tarefas
  # GET /os_tarefas.json
  def index
    @os_tarefas = OsTarefa.all
  end

  # GET /os_tarefas/1
  # GET /os_tarefas/1.json
  def show
  end

  # GET /os_tarefas/new
  def new
    ordem_servico  = OrdemServico.find(params[:os_id])
    @os_tarefa = OsTarefa.new
    @os_tarefa.ordem_servico= ordem_servico

  end

  # GET /os_tarefas/1/edit
  def edit

  end

  # POST /os_tarefas
  # POST /os_tarefas.json
  def create
    @os_tarefa = OsTarefa.new(os_tarefa_params)

    respond_to do |format|
      if @os_tarefa.save
        if @os_tarefa.ordem_servico.id!=nil
          format.html { redirect_to "/ordem_servicos/"+@os_tarefa.ordem_servico.id.to_s, notice: 'Os tarefa was successfully created.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @os_tarefa, notice: 'Os tarefa was successfully created.' }
          format.json { render :show, status: :created, location: @os_tarefa }
        end
      else
        format.html { render :new }
        format.json { render json: @os_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /os_tarefas/1
  # PATCH/PUT /os_tarefas/1.json
  def update
    respond_to do |format|
      if(@os_tarefa.situacao!=OsTarefa.situacoes[0] || @os_tarefa.situacao!=OsTarefa.situacoes[1])
        @os_tarefa.ordem_servico_pagamento=nil
      end
      if @os_tarefa.update(os_tarefa_params)
        if @os_tarefa.ordem_servico.id!=nil
          format.html { redirect_to "/ordem_servicos/"+@os_tarefa.ordem_servico.id.to_s, notice: 'Os tarefa was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @os_tarefa, notice: 'Os tarefa was successfully updated.' }
          format.json { render :show, status: :ok, location: @os_tarefa }
        end
      else
        format.html { render :edit }
        format.json { render json: @os_tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /os_tarefas/1
  # DELETE /os_tarefas/1.json
  def destroy
    @os_tarefa.destroy
    respond_to do |format|
      if @os_tarefa.ordem_servico.id!=nil
        format.js   { render :layout => false }
        format.html { redirect_to "/ordem_servicos/"+@os_tarefa.ordem_servico.id.to_s, notice: 'Os tarefa was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to os_tarefas_url, notice: 'Os tarefa was successfully destroyed.' }
        format.json { head :no_content }
        format.js   { render :layout => false }

      end
    end
  end


  # TODO FAZER METODO PARA REJEITAR VARIAS TAREFAS SELECIONADAS VIA AJAX
  # SET_SITUACAO /os_tarefas/1
  # SET_SITUACAO/os_tarefas/1.json
  def set_situacao
      id_busca  = params[:id]
      @os_id  = params[:os_id]
      @os_tarefa  = OsTarefa.find(id_busca)
      @os_tarefa.situacao='ACEITA'
      @ordem_servico = OrdemServico.find(@os_id)
      @os_tarefa.ordem_servico_pagamento= @ordem_servico
      @os_tarefa.save
      respond_to do |format|

        format.json { head :no_content }
        format.js   { render :layout => false }

    end
  end

  #
  # lista tarefas que nao foram  pagas de outras OSs
  def mostra_nao_pagas
    @os_tarefas = OsTarefa.where("id_os_pagamento is null")
        @os_id  = params[:os_id]
        render "os_tarefas/_index_tarefas_nao_pagas",
        locals: { os_tarefas: @os_tarefas },
        layout: false

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_tarefa
      @os_tarefa = OsTarefa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_tarefa_params
      params.require(:os_tarefa).permit(:os_id,:catl_id, :prod_id, :pess_abertura_tarefa_id, :pess_tarefa_atribuida_id, :entregavel_id, :id_tarefa_redmine, :ust_tarefa, :horastarefa, :situacao, :justificativa)
    end
end
