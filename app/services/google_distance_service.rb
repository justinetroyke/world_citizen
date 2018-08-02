class GoogleDistanceService

  def initialize(start, destination)
    @start_lat = start[:lat]
    @start_lng = start[:lng]
    @destination_lat = destination[:lat]
    @destination_lng = destination[:lng]
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/distancematrix/json") do |faraday|
      faraday.params['units'] = "imperial"
      faraday.params['origins'] = "#{@start_lat},#{@start_lng}"
      faraday.params['destinations'] = "#{@destination_lat},#{@destination_lng}"
      faraday.params["key"] = ENV['google_routes_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get
  end

  def parser
    JSON.parse(response.body)
  end

  def get_distance
    parser['rows'].first['elements'].first['distance']['text']
  end
end
