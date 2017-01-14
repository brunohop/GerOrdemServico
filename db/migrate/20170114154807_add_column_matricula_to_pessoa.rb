class AddColumnMatriculaToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :matricula, :string
  end
end
