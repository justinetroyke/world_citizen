class LatLongService

  def initialize(address)
    @address = address
  end


  def coordinates
    parser[:results].first[:geometry][:location]
  end

private
  def conn
    Faraday.new(url: "https://maps.googleapis.com")
  end

  def default_params
    { address: @address, key: ENV['google_geocode_api_key'] }
  end

  def response
    conn.get '/maps/api/geocode/json', default_params
  end

  def parser
    JSON.parse(response.body, {:symbolize_names => true})
  end
end
