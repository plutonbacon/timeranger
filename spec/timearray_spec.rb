require 'helper'

describe 'TimeArray' do
  subject (:ta) { TimeRanger::TimeArray.new }

  it 'should be kind of TimeArray' do
    expect(ta).to be_a(TimeArray)
  end
end
