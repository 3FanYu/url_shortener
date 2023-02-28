class ShortUrlController < ApplicationController
  def create
    return render json: { error: 'Invalid parameter format' }, status: :unprocessable_entity unless params[:url].is_a?(String)
    render json: ::CreateShortUrlMappingService.new(url: params[:url]).run
  end
end