class CreateTradeShowTradeShowTypes < ActiveRecord::Migration
  def self.up
    create_table :trade_show_trade_show_types do |t|
      t.integer :trade_show_id
      t.integer :trade_show_type_id

    end
    add_index :trade_show_trade_show_types, :trade_show_id
    add_index :trade_show_trade_show_types, :trade_show_type_id
  end

  def self.down
    drop_table :trade_show_trade_show_types
  end
end
