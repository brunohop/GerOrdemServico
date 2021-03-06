## ESSA classe esta hedando outro controlador de que tem os calculos
class OrdemServicosController < LaudosController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy]



  def identificador_os
      "OS "+@ordem_servico.id.to_s+" - "+@ordem_servico.data_inicio.year.to_s+" - "+@ordem_servico.projeto.nome+" Sprint"+ @ordem_servico.sprint.to_s
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


  def calcula_niveis_servico
    #apaga os niveis se servico relacionado caso exista algum
    @ordem_servico.os_nivel_servicos.delete_all
    #A
    total_entregaveis_aceitos= calcula_total_entregaveis(OsEntregavel.situacoes[0])+calcula_total_entregaveis(OsEntregavel.situacoes[1])
    #B
    total_entregaveis_demonstrados=calcula_total_entregaveis(OsEntregavel.situacoes[0])+calcula_total_entregaveis(OsEntregavel.situacoes[1])+calcula_total_entregaveis(OsEntregavel.situacoes[2])+calcula_total_entregaveis(OsEntregavel.situacoes[3])
    #C
    prazo_realizado = (@ordem_servico.data_fim - @ordem_servico.data_inicio).to_i
    #D
    prazo_previsto = (@ordem_servico.data_previsao - @ordem_servico.data_inicio).to_i
    #E
    total_debitos_tecnicos=calcula_total_debitos_tecnicos(@ordem_servico.os_tarefas)
    #F
    total_ust_aceito = calcula_total_ust_tarefas(OsTarefa.situacoes[0],@ordem_servico.os_tarefas)+ calcula_total_ust_tarefas(OsTarefa.situacoes[1],@ordem_servico.os_tarefas)

    if total_entregaveis_demonstrados!=0
      #ICE - ÍNDICE DE COMPLETUDE NAS ENTREGAS	(A/B) x 100
      ice= 	((total_entregaveis_aceitos.to_f / total_entregaveis_demonstrados.to_f)*100)
    else
      ice= 	100
    end
    cria_ice(ice)

    #IAOS - ÍNDICE DE ATRASO EM ORDEM DE SERVIÇO	C-D

    iaos = prazo_realizado-prazo_previsto
    cria_iaos(iaos)

    if total_debitos_tecnicos!=0 && total_ust_aceito!=0
      #IDTU - ÍNDICE DE DÉBITOS TÉCNICOS POR UST	(1 - ((log(F))/E) ) x 100
      idtu = (1 - (Math::log(total_ust_aceito.to_f,10))/total_debitos_tecnicos.to_f) *100
    else
      idtu=0
    end
    cria_idtu(idtu)
    @ordem_servico.os_nivel_servicos= OsNivelServico.where(os_id: @ordem_servico.id)
    @total_ust_aceito = calcula_total_ust_tarefas(OsTarefa.situacoes[0],@ordem_servico.os_tarefas)+ calcula_total_ust_tarefas(OsTarefa.situacoes[1],@ordem_servico.os_tarefas)
    logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    @fator_atendimento_nivel_servico = calcula_fator_atendimento_nivel_servico()
    @total_glosa_ust = @total_ust_aceito-(@total_ust_aceito * @fator_atendimento_nivel_servico)
    @ordem_servico.ust_pago= @total_ust_aceito
    @ordem_servico.ust_glosa=@total_glosa_ust
    @ordem_servico.fator_atendimento=@fator_atendimento_nivel_servico
    @ordem_servico.save

  end

  #indicador   =   ['ICE', 'IDTU', 'IAOS','IAG','IRPS']
  #nivel   =   ['DESEJÁVEL', 'NÍVEL 1', 'NÍVEL 2','NÍVEL 3']

  def cria_idtu(idtu)
    os_nivel_servico = OsNivelServico.new
    os_nivel_servico.ordem_servico=@ordem_servico
    os_nivel_servico.valor=idtu

    case
      #desejavel
    when idtu <= 86
      os_nivel_servico.indicador=OsNivelServico.indicador[1]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[0]
      os_nivel_servico.pontos=0


      #nivel1 3pontos
    when (idtu > 86  && idtu <= 90)
      os_nivel_servico.indicador=OsNivelServico.indicador[1]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[1]
      os_nivel_servico.pontos=3

      #nivel2 5pontos
    when (idtu > 90 && idtu<= 93)
      os_nivel_servico.indicador=OsNivelServico.indicador[1]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[2]
      os_nivel_servico.pontos=5
      #nivel3 10pontos
    else
      os_nivel_servico.indicador=OsNivelServico.indicador[1]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[3]
      os_nivel_servico.pontos=10
    end
    os_nivel_servico.save
  end

  def cria_iaos(iaos)
    os_nivel_servico = OsNivelServico.new
    os_nivel_servico.ordem_servico=@ordem_servico
    os_nivel_servico.valor=iaos
    case
      #desajavel
    when iaos == 0
      os_nivel_servico.indicador=OsNivelServico.indicador[2]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[0]
      os_nivel_servico.pontos=0

    #nivel1 3 pontos
  when (iaos > 0  && iaos <= 1)
      os_nivel_servico.indicador=OsNivelServico.indicador[2]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[1]
      os_nivel_servico.pontos=3
    #nivel2 6pontos
  when (iaos > 1 && iaos <= 3)
      os_nivel_servico.indicador=OsNivelServico.indicador[2]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[2]
      os_nivel_servico.pontos=6
    #nivel3 12 pontos
    else
      os_nivel_servico.indicador=OsNivelServico.indicador[2]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[3]
      os_nivel_servico.pontos=12
    end
    os_nivel_servico.save
  end

  def cria_ice(ice)
    os_nivel_servico = OsNivelServico.new
    os_nivel_servico.ordem_servico=@ordem_servico
    os_nivel_servico.valor=ice
    case
    #desajavel
  when (ice == 100.0)
      os_nivel_servico.indicador=OsNivelServico.indicador[0]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[0]
      os_nivel_servico.pontos=0
      puts "a"
    #nivel1  4pontos
  when (ice < 100 && ice >= 95)
      os_nivel_servico.indicador=OsNivelServico.indicador[0]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[1]
      os_nivel_servico.pontos=4
      puts "b"
    #nivel2  5pontos
  when (ice < 95.0 && ice >= 80.0)
      os_nivel_servico.indicador=OsNivelServico.indicador[0]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[2]
      os_nivel_servico.pontos=5
      puts "c"
    #nivel3   10pontos
    else
      os_nivel_servico.indicador=OsNivelServico.indicador[0]
      os_nivel_servico.nivel_servico=OsNivelServico.nivel[3]
      os_nivel_servico.pontos=10
      puts "d"
    end
    os_nivel_servico.save
  end


# clona ordem de servicos
  def clone
    ordem_servico = OrdemServico.find(params[:os_id])
    logger.debug "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    logger.debug(ordem_servico.os_tipo)

    @os_clone = ordem_servico.amoeba_dup
    @os_clone.situacao=OrdemServico.situacoes[1]
    @os_clone.data_inicio=@os_clone.data_inicio + 1.month
    @os_clone.data_previsao=@os_clone.data_previsao + 1.month
    @os_clone.data_fim=@os_clone.data_fim + 1.month
    @os_clone.fator_atendimento=0
    @os_clone.ust_pago=0
    @os_clone.ust_glosa=0

    @os_clone.save

    respond_to do |format|
      if @os_clone.save
        format.html { redirect_to edit_ordem_servico_path(@os_clone), notice: 'Ordem de serviço foi clonada com sucesso, altere as datas da nova OS e o Status.' }
        format.json { render :index, status: :created, location: @os_clone }
      else
        format.html { render :new }
        format.json { render json: @os_clone.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /ordem_servicos
  # GET /ordem_servicos.json
  def index
    @ordem_servicos = OrdemServico.all
    @ordem_servicos = @ordem_servicos.order(created_at: :desc)
    @ordem_servicos = @ordem_servicos.page params['page']
  end

  # GET /ordem_servicos/1
  # GET /ordem_servicos/1.json
  def show
    total_ust=0
    calcula_total()
    @total_ust_tarefas=CalcTotalUstTarefasService.new(@ordem_servico.os_tarefas, false).call
    @total_horas_tarefas=CalculaTotalHorasTarefasService.new(@ordem_servico.os_tarefas, false).call

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
        format.html { redirect_to @ordem_servico, notice: 'Ordem de serviço foi criada com sucesso.' }
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
        if @ordem_servico.situacao==OrdemServico.situacoes[0]
              calcula_niveis_servico()
        end
        format.html { redirect_to @ordem_servico, notice: 'Ordem de serviço foi atualizada com sucesso.' }
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
      format.html { redirect_to ordem_servicos_url, notice: 'Ordem de serviço foi destruída com sucesso.' }
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
      params.require(:ordem_servico).permit(:fechamento, :observacoes, :fiscal_contrato_id, :projeto_id, :preposto_id, :resp_tecnico_id, :descricao, :sprint, :data_inicio, :data_previsao, :data_fim, :situacao, :resp_requisitante_id, :tipo_os_id, :fator_atendimento, :ust_pago, :ust_glosa, :valor_ust_id)
    end
end
