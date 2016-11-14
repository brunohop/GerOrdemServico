class CreateOsDebTecnicos < ActiveRecord::Migration
  def change
    create_table :os_deb_tecnicos do |t|
      t.decimal :debt_id
      t.decimal :os_id

      t.timestamps null: false
    end
  end
end
