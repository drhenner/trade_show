class CreateTradeShowMaps < ActiveRecord::Migration
  def self.up
    create_table :trade_show_maps do |t|
      t.integer :trade_show_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :trade_show_maps
  end
end
