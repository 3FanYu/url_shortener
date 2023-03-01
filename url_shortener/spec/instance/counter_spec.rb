require 'rails_helper'

describe CounterInstance do
  context '#get_next_count' do
    it 'should return current_count + 1' do
      count1 = described_class.instance.get_next_count
      count2 = described_class.instance.get_next_count
      expect(count2).to eq(count1 + 1)
    end

    it 'should reset to 0 after 9999' do
      described_class.instance.instance_variable_set(:@counter, 9999)
      count = described_class.instance.get_next_count
      expect(count).to eq(0)
    end
  end

end