class AddColumnPontosToOsNivelServico < ActiveRecord::Migration
  def change
    add_column :os_nivel_servicos, :pontos, :integer
    add_column :os_nivel_servicos, :valor, :decimal
  end
end
