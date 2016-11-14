class Entregavel < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "entregavel_id"
  has_many :ordem_servicos, through: :os_entregavels
end
