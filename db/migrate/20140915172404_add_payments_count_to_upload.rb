class AddPaymentsCountToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :payments_count, :integer, default: 0
  end
end
