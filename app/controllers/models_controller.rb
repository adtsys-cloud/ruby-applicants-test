class ModelsController < ApplicationController

  before_filter :search_models, only: :index

  def index
    models = Model.where(make_id: @make)
    render 'index', :locals => {models: models, make: @make}
  end


  private
  def search_models
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    # Make request for Webmotors site
    @make = Make.where(webmotors_id: params[:webmotors_make_id]).first

    response = Net::HTTP.post_form(uri, { marca: params[:webmotors_make_id] })
    models_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      unless Model.where(name: json["Nome"], make_id: @make.id).first
        Model.create(make_id: @make.id, name: json["Nome"])
      end
    end
  end
end
