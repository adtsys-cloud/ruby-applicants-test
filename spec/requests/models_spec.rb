require 'rails_helper'

RSpec.describe "Models", type: :request do
  describe "GET models_path" do
    it "Load models path" do
      visit "/models"
      expect(page).to have_current_path('/models')
    end
  end
end
