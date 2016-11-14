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

ActiveRecord::Schema.define(version: 20161114194905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catalogos", force: :cascade do |t|
    t.string   "idem_catalogo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "debito_tecnicos", force: :cascade do |t|
    t.string   "debito_tecnico"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "entregavels", force: :cascade do |t|
    t.string   "entregavel"
    t.string   "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.decimal  "fiscalcontrato"
    t.decimal  "proj_id"
    t.decimal  "preposto"
    t.decimal  "resptecnico"
    t.string   "os"
    t.date     "data_inicio"
    t.date     "data_previsao"
    t.date     "data_fim"
    t.string   "situacao"
    t.decimal  "resp_requisitante"
    t.decimal  "tipo_os_id"
    t.decimal  "fator_atendimento"
    t.decimal  "ust_pago"
    t.decimal  "ust_glosa"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "os_deb_tecnicos", force: :cascade do |t|
    t.decimal  "debt_id"
    t.decimal  "os_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "os_entregavels", force: :cascade do |t|
    t.decimal  "entregavel_id"
    t.decimal  "osi_d"
    t.decimal  "ust_previsto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "os_nivel_servicos", force: :cascade do |t|
    t.decimal  "os_id"
    t.string   "nivel_servico"
    t.string   "indicador"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "os_tarefas", force: :cascade do |t|
    t.decimal  "catl_id"
    t.decimal  "prod_id"
    t.decimal  "pess_abertura_tarefa"
    t.decimal  "tarefa_atribuida"
    t.decimal  "entregavel_id"
    t.decimal  "os_id"
    t.decimal  "id_tarefa_redmnine"
    t.decimal  "ust_tarefa"
    t.decimal  "nurm_horastarefa"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "os_tipos", force: :cascade do |t|
    t.string   "os_tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "pessoa"
    t.string   "vinculo"
    t.decimal  "id_pessoa_redmine"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "produto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projetos", force: :cascade do |t|
    t.string   "projeto"
    t.decimal  "id_proj_redmine"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tarefa_deb_tecnicos", force: :cascade do |t|
    t.decimal  "tare_id"
    t.decimal  "debt_id"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
