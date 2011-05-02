# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :feature do |f|
  f.name "MyString"
  f.description "MyText"
  f.price "9.99"
  f.start_date "2011-05-01"
  f.active false
end