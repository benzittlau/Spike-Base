# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.name "Ben Zittlau"
  f.email "ben@example.com"
  f.address "100 Cool Lane"
  f.city "Edmonton"
  f.phone_number "780 123 4567"
end