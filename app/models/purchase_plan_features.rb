class PurchasePlanFeatures < ActiveRecord::Base

  belongs_to :purchase_plan
  belongs_to :feature

  validates :purchase_plan_id,  :presence => true
  validates :feature_id,        :presence => true
end
