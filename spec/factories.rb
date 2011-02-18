Factory.define :user do |user|
  user.name                   "Sample User"
  user.email                  "sample@user.com"
  user.password               "foobar"    
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end