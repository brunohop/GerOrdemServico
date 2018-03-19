class ValorUst < ActiveRecord::Base
  audited
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "valor_ust_id"

end
