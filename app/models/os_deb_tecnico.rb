class OsDebTecnico < ActiveRecord::Base
  belongs_to :debito_tecnico, class_name: "DebitoTecnico", foreign_key: "debt_id"
  belongs_to :ordem_servico, class_name: "OrdemServico", foreign_key: "os_id"
end
