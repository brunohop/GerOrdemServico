class OsTarefa < ActiveRecord::Base
  audited
  belongs_to :catalogo, class_name: "Catalogo", foreign_key: "catl_id"
  belongs_to :produto, class_name: "Produto", foreign_key: "prod_id"
  belongs_to :entregavel, class_name: "Entregavel", foreign_key: "entregavel_id"
  belongs_to :abriu_tarefa, class_name: "Pessoa", foreign_key: "pess_abertura_tarefa_id"
  belongs_to :atribuido_tarefa, class_name: "Pessoa", foreign_key: "pess_tarefa_atribuida_id"
  belongs_to :ordem_servico, class_name: "OrdemServico", foreign_key: "os_id"
  belongs_to :ordem_servico_pagamento, class_name: "OrdemServico", foreign_key: "id_os_pagamento"

  has_many :tarefa_deb_tecnicos, class_name: "TarefaDebTecnico", foreign_key: "tare_id",:dependent => :nullify

  def self.situacoes
      ['ACEITA','ACEITA COM RESSALVAS','REJEITADA','CANCELADA']
  end
end
