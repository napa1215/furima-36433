FactoryBot.define do
  factory :item do
    title         {"名前"}
    text          {"説明"}
    price           {2000}
    genre_id           {0}
    condition_id       {0}
    delivery_fee_id    {0}
    prefecture_id      {0}
    delivery_time_id   {0}  
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end