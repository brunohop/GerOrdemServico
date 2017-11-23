  #services/thing_service.rb
  class CalculaTotalHorasTarefasService

    def initialize(os_tarefas, rejeitadas)
      @os_tarefas = os_tarefas
      @rejeitadas = rejeitadas

    end
    def call
      calcula_total_horas_tarefas
    end
    private
    attr_reader :os_tarefas, :rejeitadas


    def calcula_total_horas_tarefas()
      total_horas_tarefas=0
      os_tarefas.each do |os_tarefa|

        if @rejeitadas==false
          if os_tarefa.horastarefa
            if os_tarefa.situacao==OsTarefa.situacoes[0] || os_tarefa.situacao==OsTarefa.situacoes[1]
              total_horas_tarefas =   total_horas_tarefas + os_tarefa.horastarefa
            end
          end
        else
          if os_tarefa.horastarefa
            if os_tarefa.situacao==OsTarefa.situacoes[2] || os_tarefa.situacao==OsTarefa.situacoes[3]
              total_horas_tarefas =   total_horas_tarefas + os_tarefa.horastarefa
            end
          end
        end
      end

    @total_horas_tarefas=total_horas_tarefas
    end

  end
  ### and calling by ThingService.call(param1)
