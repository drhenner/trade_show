class CreateTradeShowCompanies < ActiveRecord::Migration
  def self.up
    create_table :trade_show_companies do |t|
      t.integer :company_id
      t.integer :trade_show_id

      t.timestamps
    end
    add_index :trade_show_companies, :company_id
    add_index :trade_show_companies, :trade_show_id
  end

  def self.down
    drop_table :trade_show_companies
  end
end
