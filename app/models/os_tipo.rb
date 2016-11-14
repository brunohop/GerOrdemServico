class OsTipo < ActiveRecord::Base
    has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "tipo_os_id"


    def self.tipos
        ['CONTRUÇÃO', 'MATUTENÇÃO', 'INFRA', 'BANCO', 'SUPORTE','PROJETO']
    end

end
