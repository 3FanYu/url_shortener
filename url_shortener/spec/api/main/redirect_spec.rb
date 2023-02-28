require 'rails_helper'

describe 'get /:short_url', type: :request do
  let(:make_request) {
    lambda do |short_url = nil|
      get "/#{short_url}"
    end
  }

  context 'when short_url_mapping present' do
    let!(:short_url_mapping) { create(:short_url_mapping) }
    let(:short_url) { short_url_mapping.short_url }

    it 'should return 302' do
      make_request[short_url]
      expect(response).to have_http_status(302)
    end
  end

  context 'when short_url_mapping is not present' do
    let(:short_url) { "randomUrl" }
    it 'should return 404' do
      make_request[short_url]
      expect(response).to have_http_status(404)
    end
  end
end