class CreateTarefaDebTecnicos < ActiveRecord::Migration
  def change
    create_table :tarefa_deb_tecnicos do |t|
      t.integer :tare_id
      t.integer :debt_id

      t.timestamps null: false
    end
  end
end
