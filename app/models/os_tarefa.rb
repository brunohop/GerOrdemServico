class OsTarefa < ActiveRecord::Base
  belongs_to :catalogo
  belongs_to :produto
  belongs_to :entregavel
  belongs_to :pessoa
  belongs_to :ordem_servico
  has_many :debito_tecnicos, through: :tarefa_deb_tecnico
end
