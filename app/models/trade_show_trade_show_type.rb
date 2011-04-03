class TradeShowTradeShowType < ActiveRecord::Base

  belongs_to  :trade_show
  belongs_to  :trade_show_type

  validates :trade_show_id,           :presence => true
  validates :trade_show_type_id,      :presence => true
end
