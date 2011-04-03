class TradeShow < ActiveRecord::Base
  belongs_to :city

  has_many   :trade_show_companies
  has_many   :companies, :through => :trade_show_companies

  has_many   :trade_show_trade_show_types
  has_many   :trade_show_types, :through => :trade_show_trade_show_types

  serialize :keywords, Array
  validates  :name,               :presence => true,
                                  :length   => { :minimum => 2, :maximum => 160 }
  validates  :city_id,            :presence => true
  validates  :start_date,         :presence => true
  validates  :end_date,           :presence => true
  validates  :short_description,  :presence => true

  accepts_nested_attributes_for :trade_show_trade_show_types, :trade_show_companies


  def display_start_date(format = :us_date)
    start_date ? I18n.localize(start_date, :format => format) : 'N/A'
  end

  def display_end_date(format = :us_date)
    end_date ? I18n.localize(end_date, :format => format) : 'N/A'
  end

  def city_name
    city.name
  end

  # in the admin form this is the method called when the form is submitted, The method sets
  # the product_keywords attribute to an array of these values
  #
  # @param [String] value for set_keywords in a products form
  # @return [none]
  def set_keywords=(value)
    self.keywords = value ? value.split(',').map{|w| w.strip} : []
  end

  # method used by forms to set the array of keywords separated by a comma
  #
  # @param [none]
  # @return [String] product_keywords separated by comma
  def set_keywords
    self.keywords ? self.keywords.join(', ') : ''
  end

end
