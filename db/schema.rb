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

ActiveRecord::Schema.define(version: 20131002144921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "auth_tokens", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
  end

  create_table "device_accounts", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "device_id"
    t.uuid     "practice_id"
    t.text     "description"
    t.boolean  "active"
    t.boolean  "persist_tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_auth_tokens", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "device_account_id"
    t.uuid     "auth_token_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "device_models", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "device_model_id"
    t.text     "name"
    t.text     "description"
    t.text     "os_version"
    t.text     "unique_identifier"
    t.text     "serial_number"
    t.text     "mac_address"
    t.text     "local_ip_address"
    t.text     "public_ip_address"
    t.text     "local_port"
    t.text     "public_port"
    t.text     "admin_username"
    t.text     "admin_password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_categories", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_permissions", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "employee_id"
    t.uuid     "permission_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "employees", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "person_id"
    t.uuid     "practice_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "license_reservations", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "license_id"
    t.uuid     "device_id"
    t.uuid     "person_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "license_tokens", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "license_id"
    t.uuid     "device_id"
    t.uuid     "person_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "licenses", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "practice_id"
    t.uuid     "system_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.integer  "max_tokens",             default: 0
    t.integer  "token_duration_seconds", default: 604800
    t.datetime "updated_at"
  end

  create_table "patients", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "person_id"
    t.uuid     "practice_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "people", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "last_name"
    t.date     "birth_date"
    t.date     "death_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "system_id"
    t.text     "name"
    t.text     "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "person_id"
    t.uuid     "device_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "person_emails", id: false, force: true do |t|
    t.uuid     "id",                null: false
    t.uuid     "person_id"
    t.uuid     "email_id"
    t.uuid     "email_category_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "practice_devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "practice_id"
    t.uuid     "device_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

  create_table "practices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "name"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.text     "name"
    t.text     "code"
    t.boolean  "product?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_accounts", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "person_id"
    t.text     "password_encrypted"
    t.text     "locale"
    t.boolean  "active"
    t.boolean  "persistent_tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_auth_tokens", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "user_account_id"
    t.uuid     "auth_token_id"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "updated_at"
  end

end
