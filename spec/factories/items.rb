FactoryBot.define do
  factory :item do
    title              {Faker::Lorem.characters}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    status_id          {Faker::Number.between(from: 2, to: 7)}
    fee_id             {Faker::Number.between(from: 2, to: 3)}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    shipping_date_id   {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    explantion         {Faker::Lorem.sentences}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end

    association :user

  end
end
