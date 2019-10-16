FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password              {password}
    password_confirmation {password}
    last_name             {Gimei.last.kanji }
    first_name            {Gimei.first.hiragana}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birth_day             {"20190415"}
  end

end