class CreateOsNivelServicos < ActiveRecord::Migration
  def change
    create_table :os_nivel_servicos do |t|
      t.decimal :os_id
      t.string :nivel_servico
      t.string :indicador

      t.timestamps null: false
    end
  end
end
