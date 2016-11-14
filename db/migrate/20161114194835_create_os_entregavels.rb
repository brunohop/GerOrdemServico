class CreateOsEntregavels < ActiveRecord::Migration
  def change
    create_table :os_entregavels do |t|
      t.decimal :entregavel_id
      t.decimal :osi_d
      t.decimal :ust_previsto

      t.timestamps null: false
    end
  end
end
