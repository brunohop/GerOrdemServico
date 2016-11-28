class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :vinculo
      t.decimal :id_pessoa_redmine

      t.timestamps null: false
    end
  end
end
