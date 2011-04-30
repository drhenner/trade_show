class CreateBoothTradeShowMaps < ActiveRecord::Migration
  def self.up
    create_table :booth_trade_show_maps do |t|
      t.integer :trade_show_map_id
      t.integer :booth_id
      t.integer :x_location
      t.integer :y_location

      t.timestamps
    end
  end

  def self.down
    drop_table :booth_trade_show_maps
  end
end
