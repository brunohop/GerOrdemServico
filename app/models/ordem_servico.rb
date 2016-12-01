class OrdemServico < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_deb_tecnicos, class_name: "OsDebTecnico", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_entregavels, class_name: "OsEntregavel", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_nivel_servicos, class_name: "OsNivelServico", foreign_key: "os_id",:dependent => :delete_all
  belongs_to :projeto, class_name: "Projeto", foreign_key: "projeto_id"
  belongs_to :os_tipo, class_name: "OsTipo", foreign_key: "tipo_os_id"
  belongs_to :preposto, class_name: "Pessoa", foreign_key: "preposto_id"
  belongs_to :fiscal_contrato, class_name: "Pessoa", foreign_key: "fiscal_contrato_id"
  belongs_to :resp_tecnico, class_name: "Pessoa", foreign_key: "resp_tecnico_id"
  belongs_to :resp_requisitante, class_name: "Pessoa", foreign_key: "resp_requisitante_id"

  def self.situacoes
      ['FECHADA', 'ABERTA', 'REJEITADA']
  end
end
