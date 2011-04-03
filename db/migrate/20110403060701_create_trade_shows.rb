class CreateTradeShows < ActiveRecord::Migration
  def self.up
    create_table :trade_shows do |t|
      t.string  :name
      t.integer :city_id
      t.date    :start_date
      t.date    :end_date
      t.string  :short_description
      t.text    :description
      t.text    :keywords
      t.boolean :active, :default => true

      t.timestamps
    end

    add_index :trade_shows, :city_id
    add_index :trade_shows, :start_date
    add_index :trade_shows, :end_date
  end

  def self.down
    drop_table :trade_shows
  end
end
