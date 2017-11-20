class AddColumnIdPagamentoToOsTarefas < ActiveRecord::Migration
  def change
    add_column :os_tarefas, :id_os_pagamento, :integer
  end
end
