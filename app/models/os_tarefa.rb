class OsTarefa < ActiveRecord::Base
  belongs_to :catalogo, class_name: "Catalogo", foreign_key: "catl_id"
  belongs_to :produto, class_name: "Produto", foreign_key: "prod_id"
  belongs_to :entregavel, class_name: "Entregavel", foreign_key: "entregavel_id"
  belongs_to :abriu_tarefa, class_name: "Pessoa", foreign_key: "pess_abertura_tarefa_id"
  belongs_to :atribuido_tarefa, class_name: "Pessoa", foreign_key: "pess_tarefa_atribuida_id"
  belongs_to :ordem_servico, class_name: "OrdemServico", foreign_key: "os_id"
  has_many :debito_tecnicos, through: :tarefa_deb_tecnico
end
