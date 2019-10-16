FactoryBot.define do

  factory :google, class: SnsCredential do
    provider            {Faker::Omniauth.google[:provider]}
    uid                 {Faker::Omniauth.google[:uid]}
    user
  end

  factory :facebook, class: SnsCredential  do
    provider            {Faker::Omniauth.facebook[:provider]}
    uid                 {Faker::Omniauth.facebook[:uid]}
    user
  end

end