require 'requester/requester'

class ModelsRequester < Requester

  def request(make)
    response = Net::HTTP.post_form(self.uri, { marca: make.try(:webmotors_id) })
    models_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      unless Model.where(name: json["Nome"], make_id: make.id).first
        Model.create(
          make_id: make.id,
          name: json["Nome"]
        )
      end
    end
  end
end
