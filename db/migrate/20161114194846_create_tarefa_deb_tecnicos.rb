class CreateTarefaDebTecnicos < ActiveRecord::Migration
  def change
    create_table :tarefa_deb_tecnicos do |t|
      t.decimal :tare_id
      t.decimal :debt_id

      t.timestamps null: false
    end
  end
end
