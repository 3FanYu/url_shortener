class FetchShortUrlMappingService
  include ShortUrlHelper

  def initialize(short_url:)
    @short_url = short_url
  end

  def run
    key = decode_short_url(short_url: @short_url)
    ::ShortUrlMapping.where(key: key).to_a.first
  end
end