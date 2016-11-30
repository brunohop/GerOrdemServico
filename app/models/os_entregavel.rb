class OsEntregavel < ActiveRecord::Base
  belongs_to :entregavel, class_name: "Entregavel", foreign_key: "entregavel_id"
  belongs_to :ordem_servico, class_name: "OrdemServico", foreign_key: "os_id"
end
