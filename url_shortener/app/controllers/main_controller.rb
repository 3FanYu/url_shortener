class MainController < ApplicationController
  def redirect
    short_url_mapping = ::FetchShortUrlMappingService.new(short_url: params[:short_url]).run
    return render(file: "#{Rails.root}/public/404.html", layout: false, status: 404) unless short_url_mapping.present?
    redirect_to short_url_mapping.original_url, status: 302, allow_other_host: true
  end
end