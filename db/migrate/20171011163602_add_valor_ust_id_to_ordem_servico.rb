class AddValorUstIdToOrdemServico < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :valorUst_id, :decimal
  end
end
