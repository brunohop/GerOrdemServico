class AddColumnFechamentoToOrdemServicos < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :fechamento, :string
  end
end
