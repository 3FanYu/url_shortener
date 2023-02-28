require 'rails_helper'

describe 'post /short_urls', type: :request do
  let(:make_request) {
    lambda do |params = nil|
      post "/short_urls", params: params
    end
  }
  context 'when url present' do
    let(:params) { { url: "https://example.com" } }
    it 'should return 200' do
      make_request[params]
      expect(response).to have_http_status(200)
    end
  end

  context 'when url is not present' do
    it 'should return 422' do
      make_request[]
      expect(response).to have_http_status(422)
    end
  end
  context 'when url is not string' do
    let(:params) { { url: nil } }
    it 'should return 422' do
      make_request[params]
      expect(response).to have_http_status(422)
    end
  end
end