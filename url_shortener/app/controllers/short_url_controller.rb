class ShortUrlController < ApplicationController
  def create
    render json: ::CreateShortUrlMappingService.new(url: params[:url]).run
  end
end