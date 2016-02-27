require 'rails_helper'

RSpec.describe "Makes", type: :request do

  describe "GET makes_path" do
    it "Load root_path" do
      visit root_path
      expect(page).to have_current_path('/')
    end
  end

  describe "Select make and request models" do
    it "Select a make and request models" do
      visit root_path
      select('CHEVROLET', :from => 'webmotors_make_id_')
      click_button "Buscar modelos"
      expect(page).to have_content("<< Voltar")
    end
  end
end
