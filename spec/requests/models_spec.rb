require 'rails_helper'

RSpec.describe "Models", type: :request do

  describe "GET models_path" do
    it "Load models path" do
      visit root_path
      select 'CHEVROLET', :from => 'webmotors_make_id_'
      click_button "Buscar modelos"
      expect(page).to have_content("<< Voltar")
   end
end
