class CreateOrdemServicos < ActiveRecord::Migration
  def change
    create_table :ordem_servicos do |t|
      t.decimal :fiscalcontrato
      t.decimal :proj_id
      t.decimal :preposto
      t.decimal :resptecnico
      t.string :os
      t.date :data_inicio
      t.date :data_previsao
      t.date :data_fim
      t.string :situacao
      t.decimal :resp_requisitante
      t.decimal :tipo_os_id
      t.decimal :fator_atendimento
      t.decimal :ust_pago
      t.decimal :ust_glosa

      t.timestamps null: false
    end
  end
end
