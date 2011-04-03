class TradeShowType < ActiveRecord::Base

  has_many   :trade_show_trade_show_types
  has_many   :trade_shows, :through => :trade_show_trade_show_types

  validates  :name,       :presence => true
end
