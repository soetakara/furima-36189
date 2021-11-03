FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {"123456a"}
    password_confirmation {password}
    nickname              {Faker::Name.initials}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.in_date_period}
  end
end
