class BoothTradeShowMap < ActiveRecord::Base
  belongs_to :booth
  belongs_to :trade_show_map

  validates :booth_id,          :presence => true
  validates :trade_show_map_id, :presence => true
end
