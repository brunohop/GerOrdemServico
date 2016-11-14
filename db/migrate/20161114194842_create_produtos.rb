class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :produto

      t.timestamps null: false
    end
  end
end
