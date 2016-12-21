class AddObservacaoToOrdemServicos < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :observacoes, :text
  end
end
