class AddSecretToSites < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    add_column :sites, :secret, :string, null: false, default: "uuid_generate_v4()"
  end
end
