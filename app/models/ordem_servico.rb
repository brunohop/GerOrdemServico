class OrdemServico < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "os_id"
  has_many :debito_tecnicos, through: :os_deb_tecnicos
  has_many :entregavels, through: :os_entregavels
  has_many :os_nivel_servicos, class_name: "OsNivelServico", foreign_key: "os_id"
  belongs_to :projeto
  belongs_to :os_tipo
  belongs_to :pessoa

  def self.situacoes
      ['FECHADA', 'ABERTA', 'REJEITADA']
  end
end
