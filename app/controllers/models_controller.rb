require 'requester/models_requester'
class ModelsController < ApplicationController

  def index
    @make = Make.where(webmotors_id: params[:webmotors_make_id]).first

    # inicializa o requester para modelos
    requester = ModelsRequester.new('modelos')
    requester.request(@make)

    @models = Model.where(make_id: @make)
  end
end
