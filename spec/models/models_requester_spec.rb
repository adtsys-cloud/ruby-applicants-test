require 'requester/models_requester'
require 'rails_helper'

RSpec.describe ModelsRequester do
  let(:requester) {ModelsRequester.new('modelos')}
  let(:make) {Make.second}
  let(:link) {"http://www.webmotors.com.br/carro/modelos"}

  it "have a valid constructor" do
    expect(requester.uri).to be_a_kind_of(URI)
    expect(requester.uri.to_s).to eq(link)
  end

  it 'return array of Json' do
    expect(requester.request(make)).to be_a_kind_of(Array)
  end
end

