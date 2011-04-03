# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :trade_show do |f|
  f.name              "Trade Show Name"
  f.city              { |c| c.association(:city) }
  f.start_date        "2011-04-02"
  f.end_date          "2011-04-02"
  #f.trade_show_type   { |c| c.association(:trade_show_type) }
  f.short_description "MyString"
  f.description       "Describe the tradeshow"
  f.keywords          ['key', 'word', 'here']
end