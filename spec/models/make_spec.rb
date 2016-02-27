require 'rails_helper'

RSpec.describe Make, type: :model do
  it 'have a valid contruction' do
    make = Make.second
    expect(make).to be_valid
  end
end
