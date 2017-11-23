  #services/thing_service.rb
  class CalcTotalUstTarefasService

    def initialize(os_tarefas, rejeitadas)
      @os_tarefas = os_tarefas
      @rejeitadas = rejeitadas
    end
    def call
      calc_total_ust_tarefas
    end
    private
    attr_reader :os_tarefas, :rejeitadas

    def calc_total_ust_tarefas()
      total_ust_tarefas=0
      os_tarefas.each do |os_tarefa|

      if @rejeitadas==false
        if os_tarefa.ust_tarefa
          if os_tarefa.situacao==OsTarefa.situacoes[0] || os_tarefa.situacao==OsTarefa.situacoes[1]
              total_ust_tarefas =   total_ust_tarefas + os_tarefa.ust_tarefa
          end
        end
      else
        if os_tarefa.ust_tarefa
          if os_tarefa.situacao==OsTarefa.situacoes[2] || os_tarefa.situacao==OsTarefa.situacoes[3]
              total_ust_tarefas =   total_ust_tarefas + os_tarefa.ust_tarefa
          end
        end
      end
    end
    @total_ust_tarefas=total_ust_tarefas
    end


  end
  ### and calling by ThingService.call(param1)
