require 'requester/makes_requester'
class HomeController < ApplicationController

  def index
    requester = MakesRequester.new('marcas')
    requester.request

    @makes = Make.all
  end
end
