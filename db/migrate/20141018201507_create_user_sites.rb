class CreateUserSites < ActiveRecord::Migration
  def change
    create_table :user_sites do |t|
      t.references :site, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
