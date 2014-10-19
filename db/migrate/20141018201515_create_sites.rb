class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :guid
      t.string :name
      t.string :url
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
