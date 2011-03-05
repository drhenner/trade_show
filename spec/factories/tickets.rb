# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :ticket do |f|
  f.subject   "MyString"
  f.status    "new"
  f.details   "MyText"
  f.user        { |c| c.association(:user) }
  f.assigned_to { |c| c.association(:user) }
  f.brand       { |c| c.association(:brand) }
  f.issue_type  "MyString"
  f.active      true
end