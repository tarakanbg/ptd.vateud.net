class AddCertAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_cert_access, :boolean, :default => false
  end
end
