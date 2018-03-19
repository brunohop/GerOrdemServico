class TarefaDebTecnico < ActiveRecord::Base
    audited

    belongs_to :debito_tecnico, class_name: "DebitoTecnico", foreign_key: "debt_id"
    belongs_to :os_tarefa, class_name: "OsTarefa", foreign_key: "tare_id"
end
