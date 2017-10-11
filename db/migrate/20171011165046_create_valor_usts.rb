class CreateValorUsts < ActiveRecord::Migration
  def change
    create_table :valor_usts do |t|
      t.decimal :valor
      t.date :inicioVigencia
      t.date :fimVigencia

      t.timestamps null: false
    end
  end
end
