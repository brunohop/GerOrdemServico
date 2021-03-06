class OrdemServico < ActiveRecord::Base
  audited
  #alterar numero de itens por pagina
  #paginates_per 10
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_tarefas_pagas, class_name: "OsTarefa", foreign_key: "id_os_pagamento",:dependent => :delete_all
  has_many :os_deb_tecnicos, class_name: "OsDebTecnico", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_entregavels, class_name: "OsEntregavel", foreign_key: "os_id",:dependent => :delete_all
  has_many :os_nivel_servicos, class_name: "OsNivelServico", foreign_key: "os_id",:dependent => :delete_all
  belongs_to :projeto, class_name: "Projeto", foreign_key: "projeto_id"
  belongs_to :os_tipo, class_name: "OsTipo", foreign_key: "tipo_os_id"
  belongs_to :preposto, class_name: "Pessoa", foreign_key: "preposto_id"
  belongs_to :fiscal_contrato, class_name: "Pessoa", foreign_key: "fiscal_contrato_id"
  belongs_to :resp_tecnico, class_name: "Pessoa", foreign_key: "resp_tecnico_id"
  belongs_to :resp_requisitante, class_name: "Pessoa", foreign_key: "resp_requisitante_id"
  belongs_to :valor_ust, class_name: "ValorUst", foreign_key: "valor_ust_id"


  validates_presence_of :data_inicio, message: "Data de início deve ser preenchida"
  validates_presence_of :data_previsao, message: "Data de previsão deve ser preenchida"
  validates_presence_of :data_fim, message: "Data de fim deve ser preenchida"

  amoeba do
      enable
      include_association :os_entregavels
      include_association :os_tarefas, if: :tipo_tarefa_clonavel?

  end

  def tipo_tarefa_clonavel?
        os_tipo.id==6 || os_tipo.id==8
  end

  def self.situacoes
      ['FECHADA', 'ABERTA', 'REJEITADA']
  end

end
