class AddColumnSituacaoToOsEntregavels < ActiveRecord::Migration
  def change
    add_column :os_entregavels, :situacao, :string
  end
end
