class Projeto < ActiveRecord::Base
    has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "projeto_id"
end
