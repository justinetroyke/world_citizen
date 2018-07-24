class GoogleDistanceService

  def initialize(start, destination)
    @start = start
    @destination = destination
  end

  def response
    Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{@start}&destinations=#{@destination}&key=#{ENV['google_routes_api_key']}")
  end

  def parser
    JSON.parse(response.body)
  end

  def get_distance
    parser['rows'].first['elements'].first['distance']['text']
  end
end
