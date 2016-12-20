class AddTipoToCatalogos < ActiveRecord::Migration
  def change
    add_column :catalogos, :tipo, :string
  end
end
