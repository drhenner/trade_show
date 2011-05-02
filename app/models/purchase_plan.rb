class PurchasePlan < ActiveRecord::Base

  has_many  :booth_purchase_plans
  has_many  :booths, :through => :booth_purchase_plans

  NO_PLAN_ID    = 1
  BASIC_ID      = 2
  DETAILED_ID   = 3
  GOLD_ID       = 4
  PREMIUM_ID    = 5

  NO_PLAN       = 'No Plan'
  BASIC         = 'Basic'
  DETAILED      = 'Detailed'
  GOLD          = 'Gold'
  PREMIUM       = 'Premium'

  PURCHASE_PLANS_HASH = [
    { :name => NO_PLAN,
      :price => 0.00,
      :description => 'Free plan, Your Booth will be have a label on the Virtual Kiosk but have no information'
    },
    { :name => BASIC,
      :price => 120.00,
      :description => 'Your Booth will link to your personal web site, You can also will have a detailed description of the booth.'
    },
    { :name => DETAILED,
      :price => 250.00,
      :description => "#{BASIC} Plan and Images of your Company (booth information)"
    },
    { :name => GOLD,
      :price => 500.00,
      :description => "#{DETAILED} Plan and a list of products with descriptions"
    },
    { :name => PREMIUM,
      :price => 800.00,
      :description => 'Your Booth will be have all features available to your trade show.'
    }
  ]

  PURCHASE_PLANS = [ NO_PLAN, BASIC, DETAILED ]

  validates :name,        :presence => true
  validates :price,       :presence => true
  validates :description, :presence => true

  def self.active
    where(:active => true)
  end
end
