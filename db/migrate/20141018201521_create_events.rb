class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :site, index: true
      t.hstore :payload

      t.timestamps
    end
  end
end
