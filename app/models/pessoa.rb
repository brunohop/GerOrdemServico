class Pessoa < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "pess_abertura_tarefa"
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "tarefa_atribuida"
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "preposto"
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "resptecnico"
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "fiscalcontrato"
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "resp_requisitante"
end
