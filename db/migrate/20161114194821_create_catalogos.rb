class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|
      t.string :idem_catalogo

      t.timestamps null: false
    end
  end
end
