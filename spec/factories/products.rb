FactoryBot.define do
  factory :product do
    name                  {"フリマ"}
    description           {"フリマ"}
    price                 {100}
    condition             {2}
    status                {1}
    send_price            {1}
    ship_day              {1}
    brand                 {"フリマ"}
    prefecture_id         {1}
  end
end
