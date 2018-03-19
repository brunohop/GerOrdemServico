class DebitoTecnico < ActiveRecord::Base
  audited
  has_many :ordem_servicos, through: :os_deb_tecnicos
  has_many :os_tarefas, through: :tarefa_deb_tecnicos
end
