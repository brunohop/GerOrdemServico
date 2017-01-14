class AddColumnJustificativaToOsTarefas < ActiveRecord::Migration
  def change
    add_column :os_tarefas, :justificativa, :string
  end
end
