module ShortUrlHelper
  # salt is timestamp of 2023/1/1 00:00:00 UTC
  KEY_SALT = 1672502400000

  # key will be 10 digits of timestamp + 4 digits of counter
  # which will be encoded with base62 and become a string with length of 8
  def generate_unique_key(counter:)
    timestamp = (Time.now.to_f * 1000).to_i
    (timestamp - KEY_SALT) * CounterService::MAX_NUMBER + counter
  end

  def generate_short_url(key:)
    ::Base62.encode(key)
  end

  def decode_short_url(short_url:)
    ::Base62.decode(short_url)
  end

end
