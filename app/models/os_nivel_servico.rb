class OsNivelServico < ActiveRecord::Base
    belongs_to :ordem_servico, class_name: "OrdemServico", foreign_key: "os_id"

    def self.indicador
        ['ICE', 'IDTU', 'IAOS','IAG','IRPS']
    end
    def self.nivel
        ['DESEJÁVEL', 'NÍVEL 1', 'NÍVEL 2','NÍVEL 3']
    end
end
