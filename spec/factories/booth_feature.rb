# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :booth_feature do |f|
  f.booth   { Factory(:booth) }
  f.feature { Factory(:feature)}
end