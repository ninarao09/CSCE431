# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_211_116_213_941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admins', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'full_name'
    t.string 'uid'
    t.string 'avatar_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
  end

  create_table 'alumnis', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'attendancerecords', force: :cascade do |t|
    t.text 'note'
    t.string 'attendancetype'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'event_id'
    t.integer 'player_id'
    t.index ['event_id'], name: 'index_attendancerecords_on_event_id'
  end

  create_table 'encounters', force: :cascade do |t|
    t.text 'notes'
    t.integer 'recruit_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.string 'info'
    t.date 'date'
    t.time 'time'
    t.string 'event_type'
    t.string 'address'
    t.string 'season'
    t.string 'score'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'merchandises', force: :cascade do |t|
    t.string 'item_name'
    t.integer 'purchase_price'
    t.integer 'quantity_on_hand'
    t.integer 'sell_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'people', force: :cascade do |t|
    t.integer 'uin'
    t.string 'name'
    t.string 'email'
    t.string 'phone_number'
    t.string 'address'
    t.string 'person_type'
    t.integer 'dues'
    t.string 'status'
    t.string 'contact_type'
    t.integer 'interest_level'
    t.integer 'times_contacted'
    t.date 'date_contacted'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'attendancerecord_id'
    t.index ['attendancerecord_id'], name: 'index_people_on_attendancerecord_id'
  end

  create_table 'players', force: :cascade do |t|
    t.integer 'dues'
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'attendancerecord_id'
    t.index ['attendancerecord_id'], name: 'index_players_on_attendancerecord_id'
  end

  create_table 'recruits', force: :cascade do |t|
    t.string 'contact_type'
    t.integer 'interest_level'
    t.integer 'times_contacted'
    t.date 'date_contacted'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'rugbyhelps', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.date 'transaction_date'
    t.integer 'amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'merchandise_id'
    t.integer 'person_id'
  end
end
