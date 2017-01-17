class OsTipo < ActiveRecord::Base
    has_many :ordem_servicos, class_name: "OrdemServico", foreign_key: "tipo_os_id"


    def self.tipos
        ['CONSTRUÇÃO', 'MANUTENÇÃO', 'INFRA', 'BANCO', 'SUPORTE','PROJETO','DOCUMENTAÇÃO']
    end

end
