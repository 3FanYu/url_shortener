class CreateShortUrlMappingService
  include ShortUrlHelper

  def initialize(url:)
    @url = url
  end

  def run
    fetch_mapping
    return @short_url_mapping unless @short_url_mapping.blank?
    create_mapping
  end

  private

  def fetch_mapping
    @short_url_mapping = ::ShortUrlMapping.where(original_url: @url).to_a.first
  end

  def create_mapping
    unique_key = generate_unique_key
    short_url = generate_short_url(key: unique_key)
    ::ShortUrlMapping.create(key: unique_key, short_url: short_url, original_url: @url)
  end
end