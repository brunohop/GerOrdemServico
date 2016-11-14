class OsDebTecnico < ActiveRecord::Base
  belongs_to :debito_tecnico
  belongs_to :ordem_servico
end
