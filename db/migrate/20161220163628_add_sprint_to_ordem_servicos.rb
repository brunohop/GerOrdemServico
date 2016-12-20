class AddSprintToOrdemServicos < ActiveRecord::Migration
  def change
    add_column :ordem_servicos, :sprint, :integer
  end
end
