class CreateDebitoTecnicos < ActiveRecord::Migration
  def change
    create_table :debito_tecnicos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
