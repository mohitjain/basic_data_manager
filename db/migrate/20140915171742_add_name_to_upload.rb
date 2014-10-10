class AddNameToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :title, :string
    add_column :uploads, :notes, :text
  end
end
