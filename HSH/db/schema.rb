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

ActiveRecord::Schema.define(version: 2018_11_25_233502) do

  create_table "auctions", force: :cascade do |t|
    t.integer "precioBase"
    t.integer "residence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "estado"
    t.string "fecha"
  end

  create_table "home_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pujas", force: :cascade do |t|
    t.integer "monto"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "auction_id"
    t.integer "precioBase_actual"
  end

  create_table "residences", force: :cascade do |t|
    t.string "complejo"
    t.string "ubicacion"
    t.string "semana"
    t.string "temporada"
    t.integer "capacidad"
    t.string "descripcion"
    t.integer "precio"
    t.integer "estrellas"
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.string "estado"
    t.string "fecha"
    t.integer "residence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
