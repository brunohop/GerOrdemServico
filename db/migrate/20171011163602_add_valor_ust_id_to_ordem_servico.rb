class AddValorUstIdToOrdemServico < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :valor_ust_id, :integer
  end
end
