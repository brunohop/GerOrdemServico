class CreateOsTipos < ActiveRecord::Migration
  def change
    create_table :os_tipos do |t|
      t.string :os_tipo

      t.timestamps null: false
    end
  end
end
