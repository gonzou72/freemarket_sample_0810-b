FactoryBot.define do

  factory :address do
    postal_code                { Faker::Number.number(digits: 7)}
    prefecture                 { Gimei.prefecture.kanji }
    city                       { Gimei.city.kanji }
    street                     { Gimei.town.kanji }
    building_name              { Gimei.last.kanji }
    phone                      { Faker::Number.number(digits: 11)}
    user
  end
  
end