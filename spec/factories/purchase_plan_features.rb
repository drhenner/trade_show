# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :purchase_plan_features do |f|
  f.purchase_plan  { Factory(:purchase_plan)}
  f.feature        { Factory(:feature)}
end