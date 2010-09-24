require 'faker'

Factory.define :feedback do |f|
  f.name Faker::Name.name
  f.content Faker::Lorem.paragraph
  f.rating Feedback::RATING_VALUES.rand
end
