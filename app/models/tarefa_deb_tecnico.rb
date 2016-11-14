class TarefaDebTecnico < ActiveRecord::Base
    belongs_to :debito_tecnico
    belongs_to :os_tarefa
end
