class CreateOsTarefas < ActiveRecord::Migration
  def change
    create_table :os_tarefas do |t|
      t.decimal :catl_id
      t.decimal :prod_id
      t.decimal :pess_abertura_tarefa
      t.decimal :tarefa_atribuida
      t.decimal :entregavel_id
      t.decimal :os_id
      t.decimal :id_tarefa_redmnine
      t.decimal :ust_tarefa
      t.decimal :nurm_horastarefa

      t.timestamps null: false
    end
  end
end
