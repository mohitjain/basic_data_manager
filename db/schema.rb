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

ActiveRecord::Schema.define(version: 20141010195837) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "payments", force: true do |t|
    t.date     "invoice_date"
    t.date     "due_date"
    t.string   "partner"
    t.string   "merchant_name"
    t.string   "account_manager"
    t.string   "city"
    t.string   "salesforce_contract_number"
    t.string   "salesforce_id"
    t.string   "payment_terms"
    t.string   "payment_terms_on_schedule"
    t.integer  "deal_id"
    t.integer  "gl_invoice_id"
    t.string   "gl_status"
    t.string   "reason_code"
    t.float    "amount",                     limit: 24
    t.integer  "collected_quantity"
    t.integer  "redeemed_quantity"
    t.integer  "consumer_price"
    t.integer  "unit_price"
    t.integer  "vat"
    t.string   "cda"
    t.boolean  "merchant_pays_vat"
    t.boolean  "vat_exemption"
    t.integer  "voucher_count_in_invoice"
    t.string   "payment_status"
    t.date     "payment_date"
    t.float    "amount_adjusted",            limit: 24
    t.float    "amount_paid",                limit: 24
    t.string   "issue"
    t.date     "issue_date"
    t.string   "issue_status"
    t.string   "how_resolved"
    t.string   "txn_reference"
    t.integer  "upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["account_manager"], name: "index_payments_on_account_manager", using: :btree
  add_index "payments", ["amount"], name: "index_payments_on_amount", using: :btree
  add_index "payments", ["amount_adjusted"], name: "index_payments_on_amount_adjusted", using: :btree
  add_index "payments", ["amount_paid"], name: "index_payments_on_amount_paid", using: :btree
  add_index "payments", ["cda"], name: "index_payments_on_cda", using: :btree
  add_index "payments", ["city"], name: "index_payments_on_city", using: :btree
  add_index "payments", ["collected_quantity"], name: "index_payments_on_collected_quantity", using: :btree
  add_index "payments", ["consumer_price"], name: "index_payments_on_consumer_price", using: :btree
  add_index "payments", ["deal_id"], name: "index_payments_on_deal_id", using: :btree
  add_index "payments", ["due_date"], name: "index_payments_on_due_date", using: :btree
  add_index "payments", ["gl_invoice_id"], name: "index_payments_on_gl_invoice_id", using: :btree
  add_index "payments", ["gl_status"], name: "index_payments_on_gl_status", using: :btree
  add_index "payments", ["how_resolved"], name: "index_payments_on_how_resolved", using: :btree
  add_index "payments", ["invoice_date"], name: "index_payments_on_invoice_date", using: :btree
  add_index "payments", ["issue"], name: "index_payments_on_issue", using: :btree
  add_index "payments", ["issue_date"], name: "index_payments_on_issue_date", using: :btree
  add_index "payments", ["issue_status"], name: "index_payments_on_issue_status", using: :btree
  add_index "payments", ["merchant_name"], name: "index_payments_on_merchant_name", using: :btree
  add_index "payments", ["merchant_pays_vat"], name: "index_payments_on_merchant_pays_vat", using: :btree
  add_index "payments", ["partner"], name: "index_payments_on_partner", using: :btree
  add_index "payments", ["payment_date"], name: "index_payments_on_payment_date", using: :btree
  add_index "payments", ["payment_status"], name: "index_payments_on_payment_status", using: :btree
  add_index "payments", ["payment_terms"], name: "index_payments_on_payment_terms", using: :btree
  add_index "payments", ["payment_terms_on_schedule"], name: "index_payments_on_payment_terms_on_schedule", using: :btree
  add_index "payments", ["reason_code"], name: "index_payments_on_reason_code", using: :btree
  add_index "payments", ["redeemed_quantity"], name: "index_payments_on_redeemed_quantity", using: :btree
  add_index "payments", ["salesforce_contract_number"], name: "index_payments_on_salesforce_contract_number", using: :btree
  add_index "payments", ["salesforce_id"], name: "index_payments_on_salesforce_id", using: :btree
  add_index "payments", ["txn_reference"], name: "index_payments_on_txn_reference", using: :btree
  add_index "payments", ["unit_price"], name: "index_payments_on_unit_price", using: :btree
  add_index "payments", ["upload_id"], name: "index_payments_on_upload_id", using: :btree
  add_index "payments", ["vat"], name: "index_payments_on_vat", using: :btree
  add_index "payments", ["vat_exemption"], name: "index_payments_on_vat_exemption", using: :btree
  add_index "payments", ["voucher_count_in_invoice"], name: "index_payments_on_voucher_count_in_invoice", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "notes"
    t.integer  "payments_count", default: 0
  end

end
