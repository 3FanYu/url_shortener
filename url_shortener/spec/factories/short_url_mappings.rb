FactoryBot.define do
  factory :short_url_mapping do
    timestamp = Time.now.to_i

    key { timestamp }
    short_url { Base62.encode(timestamp) }
    sequence :original_url do |n|
      "https://#{n}.com"
    end
  end
end