class HomeController < ApplicationController

  before_filter :search_makes, only: :index

  def index
    @makes = Make.all
  end

  private
  #search the makes on webmotors
  def search_makes
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      unless Make.where(name: make_params["Nome"]).first
        Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
      end
    end
  end

end
