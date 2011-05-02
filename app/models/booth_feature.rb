class BoothFeature < ActiveRecord::Base

  belongs_to :booth
  belongs_to :feature

  validates :booth_id,    :presence => true
  validates :feature_id,  :presence => true
end
