class ShortUrlMapping
  include Mongoid::Document
  include Mongoid::Timestamps

  field :key, type: Integer
  field :short_url, type: String
  field :original_url, type: String

end
