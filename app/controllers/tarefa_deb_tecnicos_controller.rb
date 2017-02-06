class TarefaDebTecnicosController < ApplicationController
  before_action :set_tarefa_deb_tecnico, only: [:show, :edit, :update, :destroy]

  # GET /tarefa_deb_tecnicos
  # GET /tarefa_deb_tecnicos.json
  def index
    @tarefa_deb_tecnicos = TarefaDebTecnico.all
  end

  # GET /tarefa_deb_tecnicos/1
  # GET /tarefa_deb_tecnicos/1.json
  def show
  end

  # GET /tarefa_deb_tecnicos/new
  def new
    os_tarefa  = OsTarefa.find(params[:tare_id])
    @tarefa_deb_tecnico = TarefaDebTecnico.new
    @tarefa_deb_tecnico.os_tarefa= os_tarefa
  end

  # GET /tarefa_deb_tecnicos/1/edit
  def edit
  end

  # POST /tarefa_deb_tecnicos
  # POST /tarefa_deb_tecnicos.json
  def create
    @tarefa_deb_tecnico = TarefaDebTecnico.new(tarefa_deb_tecnico_params)

    respond_to do |format|
      if @tarefa_deb_tecnico.save
        if @tarefa_deb_tecnico.os_tarefa.id!=nil
          format.html { redirect_to "/os_tarefas/"+@tarefa_deb_tecnico.os_tarefa.id.to_s, notice: 'Tarefa deb tecnico was successfully created.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @tarefa_deb_tecnico, notice: 'Tarefa deb tecnico was successfully created.' }
          format.json { render :show, status: :created, location: @tarefa_deb_tecnico }
        end
      else
        format.html { render :new }
        format.json { render json: @tarefa_deb_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefa_deb_tecnicos/1
  # PATCH/PUT /tarefa_deb_tecnicos/1.json
  def update
    respond_to do |format|
      if @tarefa_deb_tecnico.update(tarefa_deb_tecnico_params)
        if @tarefa_deb_tecnico.os_tarefa.id!=nil
          format.html { redirect_to "/os_tarefas/"+@tarefa_deb_tecnico.os_tarefa.id.to_s, notice: 'Tarefa deb tecnico was successfully created.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @tarefa_deb_tecnico, notice: 'Tarefa deb tecnico was successfully updated.' }
          format.json { render :show, status: :ok, location: @tarefa_deb_tecnico }
        end
      else
        format.html { render :edit }
        format.json { render json: @tarefa_deb_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefa_deb_tecnicos/1
  # DELETE /tarefa_deb_tecnicos/1.json
  def destroy
    @tarefa_deb_tecnico.destroy
    respond_to do |format|
      if @tarefa_deb_tecnico.os_tarefa.id!=nil
        format.html { redirect_to "/os_tarefas/"+@tarefa_deb_tecnico.os_tarefa.id.to_s, notice: 'Tarefa deb tecnico was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to tarefa_deb_tecnicos_url, notice: 'Tarefa deb tecnico was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa_deb_tecnico
      @tarefa_deb_tecnico = TarefaDebTecnico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_deb_tecnico_params
      params.require(:tarefa_deb_tecnico).permit(:tare_id, :debt_id)
    end
end
