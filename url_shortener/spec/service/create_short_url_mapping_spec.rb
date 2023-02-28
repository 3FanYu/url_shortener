require 'rails_helper'

describe CreateShortUrlMappingService do
  context 'when short_url_mapping present' do
    let!(:short_url_mapping) { create(:short_url_mapping) }
    let(:expected) { "#{ENV['hostname']}:#{ENV['port']}/#{short_url_mapping.short_url}" }

    it 'should return existing short_url_mapping' do
      res = described_class.new(url: short_url_mapping.original_url).run
      expect(res.url).to eq(expected)
    end
  end

  context 'when short_url_mapping is not present' do
    let(:url) { "randomUrl" }
    it 'should create 1 new mapping' do
      expect(::ShortUrlMapping.all.count).to eq(0)
      described_class.new(url: url).run
      expect(::ShortUrlMapping.all.count).to eq(1)
    end
  end

  context 'when new record created' do
    let(:url) { "randomUrl" }
    it 'should have encoded key as short_url ' do
      described_class.new(url: url).run
      new_record = ::ShortUrlMapping.first
      expect(Base62.encode(new_record.key)).to eq(new_record.short_url) 
    end
  end
end