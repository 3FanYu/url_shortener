class ShortUrlMapping
  include Mongoid::Document
  include Mongoid::Timestamps

  index({created_at: 1}, {expire_after_seconds: 10})
  index({key: 1}, { unique: true})

  field :key, type: Integer
  field :short_url, type: String
  field :original_url, type: String

end
