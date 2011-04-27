class Owner < ActiveRecord::Base

  belongs_to :company
  has_many :images, :as         => :imageable,
                    :order      => :position,
                    :dependent  => :destroy

  accepts_nested_attributes_for :images, :reject_if => lambda { |t| t['photo'].nil? }
  before_save :create_content

    validates   :company_id,          :presence => true
    validates   :name,                :presence => true
    validates   :brief_description,   :presence => true
    #validates   :full_description
    validates   :description_markup,  :presence => true

  def company_name
    company.name
  end

  private

    def create_content
      self.full_description = BlueCloth.new(self.description_markup).to_html unless self.description_markup.blank?
    end
end
