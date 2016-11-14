class OsEntregavel < ActiveRecord::Base
  belongs_to :entregavel
  belongs_to :ordem_servico
end
