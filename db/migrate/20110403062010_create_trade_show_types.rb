class CreateTradeShowTypes < ActiveRecord::Migration
  def self.up
    create_table :trade_show_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :trade_show_types
  end
end
