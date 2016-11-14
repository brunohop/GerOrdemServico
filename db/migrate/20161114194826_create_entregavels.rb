class CreateEntregavels < ActiveRecord::Migration
  def change
    create_table :entregavels do |t|
      t.string :entregavel
      t.string :ativo

      t.timestamps null: false
    end
  end
end
