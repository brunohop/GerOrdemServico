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
        format.html { redirect_to @os_tarefa, notice: 'Os tarefa was successfully created.' }
        format.json { render :show, status: :created, location: @os_tarefa }
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
      if @os_tarefa.update(os_tarefa_params)
        format.html { redirect_to @os_tarefa, notice: 'Os tarefa was successfully updated.' }
        format.json { render :show, status: :ok, location: @os_tarefa }
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
      format.html { redirect_to os_tarefas_url, notice: 'Os tarefa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_os_tarefa
      @os_tarefa = OsTarefa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def os_tarefa_params
      params.require(:os_tarefa).permit(:os_id,:catl_id, :prod_id, :pess_abertura_tarefa_id, :pess_tarefa_atribuida_id, :entregavel_id, :id_tarefa_redmine, :ust_tarefa, :horastarefa)
    end
end
