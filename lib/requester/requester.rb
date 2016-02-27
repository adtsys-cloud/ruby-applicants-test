class Requester

  attr_accessor :uri

  def initialize(url_path)
    self.uri = URI("http://www.webmotors.com.br/carro/#{url_path}")
  end

  def request
  end
end
