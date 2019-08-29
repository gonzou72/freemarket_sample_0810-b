FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"田中"}
    first_name            {"てすと"}
    last_name_kana        {"カキクケコ"}
    first_name_kana       {"アイウエオ"}
    birth_day             {"20190415"}
  end

end