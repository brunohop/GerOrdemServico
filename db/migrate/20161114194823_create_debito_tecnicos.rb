class CreateDebitoTecnicos < ActiveRecord::Migration
  def change
    create_table :debito_tecnicos do |t|
      t.string :debito_tecnico

      t.timestamps null: false
    end
  end
end
