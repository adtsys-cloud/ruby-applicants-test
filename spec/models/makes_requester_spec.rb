require 'requester/makes_requester'
require 'rails_helper'

RSpec.describe MakesRequester do
  let(:requester) {MakesRequester.new('marcas')}
  let(:link) {"http://www.webmotors.com.br/carro/marcas"}

  it "have a valid constructor" do
    expect(requester.uri).to be_a_kind_of(URI)
    expect(requester.uri.to_s).to eq(link)
  end

  it 'return array of Json' do
    expect(requester.request).to be_a_kind_of(Array)
  end
end

