class AddColumnJustificativaToOsEntregavels < ActiveRecord::Migration
  def change
    add_column :os_entregavels, :justificativa, :string
  end
end
