class CreateShortUrlMappingService
  include ShortUrlHelper

  def initialize(url:)
    @url = url
  end

  def run
    fetch_mapping
    return render_result unless @short_url_mapping.blank?
    fetch_counter
    create_mapping
    render_result
  end

  private

  def fetch_mapping
    @short_url_mapping = ::ShortUrlMapping.where(original_url: @url).to_a.first
  end

  def fetch_counter
    @counter = ::CounterService.instance.get_next_count
  end

  def create_mapping
    unique_key = generate_unique_key(counter: @counter)
    short_url = generate_short_url(key: unique_key)
    @short_url_mapping = ::ShortUrlMapping.create!(key: unique_key, short_url: short_url, original_url: @url)
  end

  def render_result
    ::ShortUrlMappingEntity.represent(@short_url_mapping)
  end
end