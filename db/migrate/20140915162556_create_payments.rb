class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :invoice_date
      t.date :due_date
      t.string :partner
      t.string :merchant_name
      t.string :account_manager
      t.string :city
      t.string :salesforce_contract_number
      t.string :salesforce_id
      t.string :payment_terms
      t.string :payment_terms_on_schedule
      t.integer :deal_id
      t.integer :gl_invoice_id
      t.string :gl_status
      t.string :reason_code
      t.float :amount
      t.integer :collected_quantity
      t.integer :redeemed_quantity
      t.integer :consumer_price
      t.integer :unit_price
      t.integer :vat
      t.string :cda
      t.boolean :merchant_pays_vat
      t.boolean :vat_exemption
      t.integer :voucher_count_in_invoice
      t.string :payment_status
      t.date :payment_date
      t.float :amount_adjusted
      t.float :amount_paid
      t.string :issue
      t.date :issue_date
      t.string :issue_status
      t.string :how_resolved
      t.string :txn_reference
      t.integer :upload_id

      t.timestamps
    end

    add_index :payments, :invoice_date
    add_index :payments, :due_date
    add_index :payments, :partner
    add_index :payments, :merchant_name
    add_index :payments, :account_manager
    add_index :payments, :city
    add_index :payments, :salesforce_contract_number
    add_index :payments, :salesforce_id
    add_index :payments, :payment_terms
    add_index :payments, :payment_terms_on_schedule
    add_index :payments, :deal_id
    add_index :payments, :gl_invoice_id
    add_index :payments, :gl_status
    add_index :payments, :reason_code
    add_index :payments, :amount
    add_index :payments, :collected_quantity
    add_index :payments, :redeemed_quantity
    add_index :payments, :consumer_price
    add_index :payments, :unit_price
    add_index :payments, :vat
    add_index :payments, :cda
    add_index :payments, :merchant_pays_vat
    add_index :payments, :vat_exemption
    add_index :payments, :voucher_count_in_invoice
    add_index :payments, :payment_status
    add_index :payments, :payment_date
    add_index :payments, :amount_adjusted
    add_index :payments, :amount_paid
    add_index :payments, :issue
    add_index :payments, :issue_date
    add_index :payments, :issue_status
    add_index :payments, :how_resolved
    add_index :payments, :txn_reference
    add_index :payments, :upload_id
  end
end
