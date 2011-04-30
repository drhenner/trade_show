class CreateBooths < ActiveRecord::Migration
  def self.up
    create_table :booths do |t|
      t.integer :company_id
      t.integer :trade_show_id

      t.timestamps
    end
    add_index :booths, :company_id
    add_index :booths, :trade_show_id
  end

  def self.down
    drop_table :booths
  end
end
