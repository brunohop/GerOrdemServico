class CreateEntregavels < ActiveRecord::Migration
  def change
    create_table :entregavels do |t|
      t.string :nome
      t.string :ativo

      t.timestamps null: false
    end
  end
end
