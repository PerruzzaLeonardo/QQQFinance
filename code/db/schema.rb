# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_20_152613) do
  create_table "aziones", force: :cascade do |t|
    t.string "nome"
    t.string "isin"
    t.string "settore"
    t.string "paese"
    t.float "marketcap"
    t.float "prezzo"
    t.float "volume"
    t.float "pe"
    t.float "ps"
    t.float "pb"
    t.float "divyield"
    t.float "roe"
    t.float "roa"
    t.float "debteq"
    t.float "opmargin"
    t.float "ebitda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "titolo"
    t.string "descrizione"
    t.string "autore"
    t.string "url"
    t.string "urlimg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "email"
    t.string "username"
    t.string "pubblico"
    t.string "commento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "user"
    t.string "azione"
    t.integer "quantità"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
