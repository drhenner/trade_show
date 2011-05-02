class Booth < ActiveRecord::Base

  belongs_to  :trade_show
  belongs_to  :company
  has_many  :booth_features
  has_many  :features, :through => :booth_features

  validates :trade_show_id,   :presence => true
  validates :company_id,      :presence => true

  def name
    company.name
  end

end
