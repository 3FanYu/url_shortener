class ShortUrlMappingEntity < Grape::Entity
  expose :url

  def url
    "#{ENV['hostname']}:#{ENV['port']}/#{object.short_url}"
  end

end