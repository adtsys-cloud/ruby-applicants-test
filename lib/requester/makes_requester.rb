require 'requester/requester'

class MakesRequester < Requester

  def request
    response = Net::HTTP.post_form(self.uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      unless make_params["Nome"].blank? || Make.where(name: make_params["Nome"]).first
        Make.create(
          name: make_params["Nome"],
          webmotors_id: make_params["Id"]
        )
      end
    end
  end
end
