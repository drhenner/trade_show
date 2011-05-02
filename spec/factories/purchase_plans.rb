# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :purchase_plan do |f|
  f.name "MyString"
  f.price "9.99"
  f.start_date "2011-05-01"
  f.end_date "2011-05-01"
  f.description "MyText"
  f.active false
end