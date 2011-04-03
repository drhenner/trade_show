class TradeShowCompany < ActiveRecord::Base

  belongs_to  :trade_show
  belongs_to  :company

  validates :trade_show_id,   :presence => true
  validates :company_id,      :presence => true
end
