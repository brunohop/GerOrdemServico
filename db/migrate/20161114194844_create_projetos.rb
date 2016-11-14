class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :projeto
      t.decimal :id_proj_redmine

      t.timestamps null: false
    end
  end
end
