class RenameNomeInOrdemServicos < ActiveRecord::Migration
  def change
    rename_column :ordem_servicos, :nome, :descricao

  end
end
