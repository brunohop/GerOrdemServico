class CreateOsDebTecnicos < ActiveRecord::Migration
  def change
    create_table :os_deb_tecnicos do |t|
      t.integer :debt_id
      t.integer :os_id

      t.timestamps null: false
    end
end
end
