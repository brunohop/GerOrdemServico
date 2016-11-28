class CreateOsEntregavels < ActiveRecord::Migration
  def change
    create_table :os_entregavels do |t|
      t.integer :entregavel_id
      t.integer :os_id
      t.decimal :ust_previsto

      t.timestamps null: false
    end
  end
end
