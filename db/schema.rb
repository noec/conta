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

ActiveRecord::Schema.define(version: 20160822035503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_types", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "business_partner_id"
    t.integer  "coin_id"
    t.integer  "bill_type_id"
    t.text     "nota"
    t.string   "numero"
    t.date     "fecha"
    t.date     "fecha_de_vencimiento"
    t.boolean  "anulada"
    t.integer  "payment_type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["bill_type_id"], name: "index_bills_on_bill_type_id", using: :btree
    t.index ["business_partner_id"], name: "index_bills_on_business_partner_id", using: :btree
    t.index ["coin_id"], name: "index_bills_on_coin_id", using: :btree
    t.index ["payment_type_id"], name: "index_bills_on_payment_type_id", using: :btree
  end

  create_table "business_partner_types", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "business_partners", force: :cascade do |t|
    t.string   "nombre",                   default: "",   null: false
    t.integer  "business_partner_type_id",                null: false
    t.integer  "coin_id",                                 null: false
    t.string   "telefono",                 default: ""
    t.string   "celular"
    t.string   "email",                    default: ""
    t.boolean  "activo",                   default: true, null: false
    t.text     "direccion"
    t.string   "identificador",            default: "",   null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["business_partner_type_id"], name: "index_business_partners_on_business_partner_type_id", using: :btree
    t.index ["coin_id"], name: "index_business_partners_on_coin_id", using: :btree
  end

  create_table "coins", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "simbolo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "description"
    t.string   "imei"
    t.string   "serie"
    t.date     "fecha_de_ingreso"
    t.decimal  "compra"
    t.decimal  "utilidad"
    t.decimal  "venta"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "bills", "bill_types"
  add_foreign_key "bills", "business_partners"
  add_foreign_key "bills", "coins"
  add_foreign_key "bills", "payment_types"
end
