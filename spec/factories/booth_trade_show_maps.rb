# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :booth_trade_show_map do |f|
  f.trade_show_map  { Factory(:trade_show_map)}
  f.booth           { Factory(:booth)}
  f.x_location 1
  f.y_location 1
end