class AddForeignKeyToTables < ActiveRecord::Migration
  def change
    add_foreign_key "ordem_servicos", "pessoas", column: "fiscal_contrato_id", primary_key: "id", name: "pessoa_ordemservico_fk3"
    add_foreign_key "ordem_servicos", "pessoas", column: "preposto_id", primary_key: "id", name: "pessoa_ordemservico_fk2"
    add_foreign_key "ordem_servicos", "pessoas", column: "resp_requisitante_id", primary_key: "id", name: "pessoa_ordemservico_fk1"
    add_foreign_key "ordem_servicos", "pessoas", column: "resp_tecnico_id", primary_key: "id", name: "pessoa_ordemservico_fk"
    add_foreign_key "ordem_servicos", "projetos", column: "projeto_id", primary_key: "id", name: "projeto_ordemservico_fk"
    add_foreign_key "ordem_servicos", "os_tipos", column: "tipo_os_id", primary_key: "id", name: "tipoos_ordemservico_fk"
    add_foreign_key "os_deb_tecnicos", "debito_tecnicos", column: "debt_id", primary_key: "id", name: "debitotecnico_osdebtecnico_fk"
    add_foreign_key "os_deb_tecnicos", "ordem_servicos", column: "os_id", primary_key: "id", name: "ordemservico_osdebtecnico_fk"
    add_foreign_key "os_entregavels", "entregavels", column: "entregavel_id", primary_key: "id", name: "entregavel_osentregavel_fk"
    add_foreign_key "os_entregavels", "ordem_servicos", column: "os_id", primary_key: "id", name: "ordemservico_osentregavel_fk"
    add_foreign_key "os_nivel_servicos", "ordem_servicos", column: "os_id", primary_key: "id", name: "ordemservico_osnivelservico_fk"
    add_foreign_key "tarefa_deb_tecnicos", "debito_tecnicos", column: "debt_id", primary_key: "id", name: "debitotecnico_tarefa_debtecnico_fk"
    add_foreign_key "tarefa_deb_tecnicos", "os_tarefas", column: "tare_id", primary_key: "id", name: "tarefasos_tarefa_debtecnico_fk"
    add_foreign_key "os_tarefas", "catalogos", column: "catl_id", primary_key: "id", name: "catalogo_tarefasos_fk"
    add_foreign_key "os_tarefas", "entregavels", column: "entregavel_id", primary_key: "id", name: "entregavel_tarefasremuneradas_fk"
    add_foreign_key "os_tarefas", "ordem_servicos", column: "os_id", primary_key: "id", name: "ordemservico_tarefasremuneradas_fk"
    add_foreign_key "os_tarefas", "pessoas", column: "pess_abertura_tarefa_id", primary_key: "id", name: "pessoa_tarefasos_fk1"
    add_foreign_key "os_tarefas", "pessoas", column: "pess_tarefa_atribuida_id", primary_key: "id", name: "pessoa_tarefasos_fk"
    add_foreign_key "os_tarefas", "produtos", column: "prod_id", primary_key: "id", name: "produto_tarefasos_fk"


  end
end
