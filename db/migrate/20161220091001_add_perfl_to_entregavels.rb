class AddPerflToEntregavels < ActiveRecord::Migration
  def change
    add_column :entregavels, :perfil, :string
  end
end
