class Feature < ActiveRecord::Base

  has_many  :booth_features
  has_many  :booths, :through => :booth_features

  validates :name,        :presence => true
  validates :description, :presence => true
  validates :price,       :presence => true, :numericality => true


  NAME_ID                 = 1
  LINK_ID                 = 2
  COMPANY_DESCRIPTION_ID  = 3
  COMPANY_PICTURES_ID     = 4
  PRODUCT_LIST_ID         = 5
  PRODUCT_DESCRIPTIONS_ID = 6

  NAME                  = 'Name'
  LINK                  = 'Link'
  COMPANY_DESCRIPTION   = 'Description of your Booth/Company'
  COMPANY_PICTURES      = 'Pictures of your Company'
  PRODUCT_LIST          = 'List of products associated with your Booth'
  PRODUCT_DESCRIPTIONS  = 'Description of products associated with your Booth'
  PRODUCT_PICTURES      = 'Images of products associated with your Booth'


  FEATURES_HASH = [
    { :name => NAME,
      :price => 0.00,
      :description => 'Free, Your Booth will be have a label on the Virtual Kiosk but have no information.'
    },
    { :name         => LINK,
      :price        => 100.00,
      :description  => 'Your Booth will be have a link to your web site.'
    },
    { :name         => COMPANY_DESCRIPTION,
      :price        => 50.00,
      :description  => 'Your Booth will be have a detailed description.'
    },
    { :name         => COMPANY_PICTURES,
      :price        => 200.00,
      :description  => 'You will have images relating to your booth.'
    },
    { :name         => PRODUCT_LIST,
      :price        => 100.00,
      :description  => 'You will have products relating to your booth.'
    },
    { :name         => PRODUCT_DESCRIPTIONS,
      :price        => 250.00,
      :description  => 'You will have description of your products relating to your booth.'
    },
    { :name         => PRODUCT_PICTURES,
      :price        => 350.00,
      :description  => 'You will have images of your products relating to your booth.'
    }
  ]

end
