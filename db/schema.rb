# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170208095513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catalogos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tipo"
  end

  create_table "debito_tecnicos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entregavels", force: :cascade do |t|
    t.string   "nome"
    t.string   "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "perfil"
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.integer  "fiscal_contrato_id"
    t.integer  "projeto_id"
    t.integer  "preposto_id"
    t.integer  "resp_tecnico_id"
    t.string   "descricao"
    t.date     "data_inicio"
    t.date     "data_previsao"
    t.date     "data_fim"
    t.string   "situacao"
    t.integer  "resp_requisitante_id"
    t.integer  "tipo_os_id"
    t.decimal  "fator_atendimento"
    t.decimal  "ust_pago"
    t.decimal  "ust_glosa"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "sprint"
    t.text     "observacoes"
    t.string   "fechamento"
  end

  create_table "os_deb_tecnicos", force: :cascade do |t|
    t.integer  "debt_id"
    t.integer  "os_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "os_entregavels", force: :cascade do |t|
    t.integer  "entregavel_id"
    t.integer  "os_id"
    t.decimal  "ust_previsto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "situacao"
    t.string   "justificativa"
  end

  create_table "os_nivel_servicos", force: :cascade do |t|
    t.integer  "os_id"
    t.string   "nivel_servico"
    t.string   "indicador"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pontos"
    t.decimal  "valor"
  end

  create_table "os_tarefas", force: :cascade do |t|
    t.integer  "catl_id"
    t.integer  "prod_id"
    t.integer  "pess_abertura_tarefa_id"
    t.integer  "pess_tarefa_atribuida_id"
    t.integer  "entregavel_id"
    t.integer  "os_id"
    t.decimal  "id_tarefa_redmine"
    t.decimal  "ust_tarefa"
    t.decimal  "horastarefa"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "situacao"
    t.string   "justificativa"
  end

  create_table "os_tipos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "vinculo"
    t.decimal  "id_pessoa_redmine"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "matricula"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projetos", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "id_proj_redmine"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tarefa_deb_tecnicos", force: :cascade do |t|
    t.integer  "tare_id"
    t.integer  "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "ordem_servicos", "os_tipos", column: "tipo_os_id", name: "tipoos_ordemservico_fk"
  add_foreign_key "ordem_servicos", "pessoas", column: "fiscal_contrato_id", name: "pessoa_ordemservico_fk3"
  add_foreign_key "ordem_servicos", "pessoas", column: "preposto_id", name: "pessoa_ordemservico_fk2"
  add_foreign_key "ordem_servicos", "pessoas", column: "resp_requisitante_id", name: "pessoa_ordemservico_fk1"
  add_foreign_key "ordem_servicos", "pessoas", column: "resp_tecnico_id", name: "pessoa_ordemservico_fk"
  add_foreign_key "ordem_servicos", "projetos", name: "projeto_ordemservico_fk"
  add_foreign_key "os_deb_tecnicos", "debito_tecnicos", column: "debt_id", name: "debitotecnico_osdebtecnico_fk"
  add_foreign_key "os_deb_tecnicos", "ordem_servicos", column: "os_id", name: "ordemservico_osdebtecnico_fk"
  add_foreign_key "os_entregavels", "entregavels", name: "entregavel_osentregavel_fk"
  add_foreign_key "os_entregavels", "ordem_servicos", column: "os_id", name: "ordemservico_osentregavel_fk"
  add_foreign_key "os_nivel_servicos", "ordem_servicos", column: "os_id", name: "ordemservico_osnivelservico_fk"
  add_foreign_key "os_tarefas", "catalogos", column: "catl_id", name: "catalogo_tarefasos_fk"
  add_foreign_key "os_tarefas", "entregavels", name: "entregavel_tarefasremuneradas_fk"
  add_foreign_key "os_tarefas", "ordem_servicos", column: "os_id", name: "ordemservico_tarefasremuneradas_fk"
  add_foreign_key "os_tarefas", "pessoas", column: "pess_abertura_tarefa_id", name: "pessoa_tarefasos_fk1"
  add_foreign_key "os_tarefas", "pessoas", column: "pess_tarefa_atribuida_id", name: "pessoa_tarefasos_fk"
  add_foreign_key "os_tarefas", "produtos", column: "prod_id", name: "produto_tarefasos_fk"
  add_foreign_key "tarefa_deb_tecnicos", "debito_tecnicos", column: "debt_id", name: "debitotecnico_tarefa_debtecnico_fk"
  add_foreign_key "tarefa_deb_tecnicos", "os_tarefas", column: "tare_id", name: "tarefasos_tarefa_debtecnico_fk"
end
