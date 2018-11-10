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

ActiveRecord::Schema.define(version: 2018_11_10_140942) do

  create_table "auctions", force: :cascade do |t|
    t.integer "precioBase"
    t.integer "residencia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residences", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "address"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "precio"
    t.integer "person"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "Password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viviendas", force: :cascade do |t|
    t.integer "cod"
    t.string "titulo"
    t.string "descripcion"
    t.integer "precio"
    t.string "ubicacion"
    t.integer "cant_personas"
    t.integer "cant_estrellas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
