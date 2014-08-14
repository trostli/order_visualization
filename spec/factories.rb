FactoryGirl.define do

  factory :hub do
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
  end

  factory :order do
    hub
    driver_id Random.new.rand(1..9)
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    num_items Random.new.rand(1..3)
    created_at Time.now
    started_at Time.now+300
    completed_at Time.now+600
  end

end
