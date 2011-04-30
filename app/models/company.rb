class Company < ActiveRecord::Base
  #has_friendly_id :permalink, :use_slug => false

  has_many :sellers
  has_many :brands
  has_many :images, :as         => :imageable,
                    :order      => :position,
                    :dependent  => :destroy
  has_many :owners

  has_many :booths
  has_many :companies, :through => :booths

  before_validation :sanitize_data

  validates :permalink,         :presence => true, :length => { :maximum => 100, :minimum => 2 }
  validates :name,              :presence => true, :length => { :maximum => 100, :minimum => 2 }
  validates :website,           :presence => true, :length => { :maximum => 100, :minimum => 5 }
  validates :email,             :presence => true, :length => { :maximum => 120, :minimum => 6 }
  validates :label,             :presence => true, :length => { :maximum => 100, :minimum => 4 }
  validates :full_description,  :presence => true


  accepts_nested_attributes_for :images, :reject_if => lambda { |t| t['photo'].nil? }


  private

  # sanitizes the saving of data.  removes white space and assigns a free account type if one doesn't exist
  #
  # @param  [ none ]
  # @return [ none ]
  def sanitize_data
    self.email      = self.email.strip.downcase       unless email.blank?
    self.name       = self.name.strip.capitalize      unless name.nil?
    self.website    = self.website.strip              unless website.nil?
    self.label      = self.label.strip                unless label.nil?
    self.permalink      = self.permalink.strip        unless permalink.nil?

    ## CHANGE THIS IF YOU HAVE DIFFERENT ACCOUNT TYPES
    unless account_id
      self.account = Account.first
    end
  end
end
