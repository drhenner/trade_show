# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.sequence :permalink do |n|
  "permalink#{n}"
end

Factory.define :company do |f|
  f.name "Nike"
  f.label "Just Do it!"
  f.brief_description "shoe company"
  f.full_description "We sell Tiger Woods stuff and much much more."

  f.website         'http://www.ror-e.com'
  f.full_markdown   'TExt'
  f.email           'drhenner@rorecommerce.com'
  f.permalink       { Factory.next(:permalink) }
end