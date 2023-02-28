class ShortUrlMapping
  include Mongoid::Document
  include Mongoid::Timestamps

  # salt is timestamp of 2023/1/1 00:00:00 UTC
  SALT = 1672502400000 

  field :key, type: Integer
  field :short_url, type: String
  field :original_url, type: String

  class << self
    def create_mapping(original_url)
      key = (Time.now.to_f * 1000).to_i - SALT
      short_url = Base62.encode(key)
      self.create(key: key, short_url: short_url, original_url: original_url)
    end
  end
end
