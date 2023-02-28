module ShortUrlHelper
  # salt is timestamp of 2023/1/1 00:00:00 UTC
  KEY_SALT = 1672502400000
  MAX_RANDOM_NUMBER = 10000

  def generate_unique_key
    timestamp = (Time.now.to_f * 1000).to_i
    # counter should be a global counter for in large distributed system to ensure uniqueness
    # for this project I will just use a random number first
    counter = rand(MAX_RANDOM_NUMBER)
    (timestamp - KEY_SALT) * MAX_RANDOM_NUMBER + counter
  end

  def generate_short_url(key:)
    ::Base62.encode(key)
  end

  def decode_short_url(short_url:)
    ::Base62.decode(short_url)
  end

end
