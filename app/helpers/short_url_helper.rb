module ShortUrlHelper
  # salt is timestamp of 2023/1/1 00:00:00 UTC
  KEY_SALT = 1672502400000

  def generate_unique_key
    (Time.now.to_f * 1000).to_i - KEY_SALT
  end

  def generate_short_url(key:)
    ::Base62.encode(key)
  end
  
end
