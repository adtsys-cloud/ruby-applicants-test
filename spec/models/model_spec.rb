require 'rails_helper'

RSpec.describe Model, type: :model do
  it 'have a valid contruction' do
    model = models(:valid_model)
    expect(model).to be_valid
  end
end
