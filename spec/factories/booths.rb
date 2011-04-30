# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :booth do |f|
  f.company       { Factory(:company)}
  f.trade_show    { Factory(:trade_show)}
end