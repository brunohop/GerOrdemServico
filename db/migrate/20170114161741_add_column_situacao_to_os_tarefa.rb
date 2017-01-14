class AddColumnSituacaoToOsTarefa < ActiveRecord::Migration
  def change
    add_column :os_tarefas, :situacao, :string
  end
end
