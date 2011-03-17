# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.name "MyString"
  f.email "MyString"
  f.address "MyString"
  f.city "MyString"
  f.phone_number "MyString"
end