class GoogleDistanceService

  def initialize(start, destination)
    @start = start
    @destination = destination
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com/maps/api/distancematrix/') do |faraday|
    end
  end

  def body
    Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{@start}&destinations=#{@destination}&key=#{ENV['google_routes_api_key']}").body
  end

  def
    body = JSON.parse(response.body)
  end

  def get_distance
    body['rows'].first['elements'].first['distance']['text']
  end

end
