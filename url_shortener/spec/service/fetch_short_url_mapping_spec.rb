require 'rails_helper'

describe FetchShortUrlMappingService do
  context 'when short_url_mapping present' do
    let!(:short_url_mapping) { create(:short_url_mapping) }

    it 'should return existing short_url_mapping' do
      res = described_class.new(short_url: short_url_mapping.short_url).run
      expect(res).to eq(short_url_mapping)
    end
  end

  context 'when short_url_mapping is not present' do
    let(:url) { "randomUrl" }

    it 'should create 1 new mapping' do
      res = described_class.new(short_url: url).run
      expect(res).to be_nil
    end
  end
end
