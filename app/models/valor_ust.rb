class ValorUst < ActiveRecord::Base
  has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "valor_ust_id"

end
