FactoryBot.define do
  factory :product do
    name                  {"メルカリ"}
    description           {"メルカリ"}
    price                 {100}
    condition             {2}
    status                {1}
    send_price            {1}
    ship_day              {1}
    brand                 {"メリカリ"}
    prefecture_id         {1}
  end
end
