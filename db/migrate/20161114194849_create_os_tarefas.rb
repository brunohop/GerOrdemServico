class CreateOsTarefas < ActiveRecord::Migration
  def change
    create_table :os_tarefas do |t|
      t.integer :catl_id
      t.integer :prod_id
      t.integer :pess_abertura_tarefa_id
      t.integer :pess_tarefa_atribuida_id
      t.integer :entregavel_id
      t.integer :os_id
      t.decimal :id_tarefa_redmine
      t.decimal :ust_tarefa
      t.decimal :horastarefa

      t.timestamps null: false
    end
end
end
