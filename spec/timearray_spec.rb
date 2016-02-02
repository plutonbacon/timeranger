require 'helper'

describe TimeRanger::TimeArray do
  let(:ta) { described_class }

  it 'is a kind of TimeArray' do
    expect(ta).to be_a(described_class)
  end
end
