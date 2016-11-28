class CreateOrdemServicos < ActiveRecord::Migration
  def change
    create_table :ordem_servicos do |t|
      t.integer :fiscal_contrato_id
      t.integer :projeto_id
      t.integer :preposto_id
      t.integer :resp_tecnico_id
      t.string :nome
      t.date :data_inicio
      t.date :data_previsao
      t.date :data_fim
      t.string :situacao
      t.integer :resp_requisitante_id
      t.integer :tipo_os_id
      t.decimal :fator_atendimento
      t.decimal :ust_pago
      t.decimal :ust_glosa
      t.timestamps null: false
    end
  end
end
