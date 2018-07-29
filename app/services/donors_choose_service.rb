class DonorsChooseService
  def initialize(path, params = {})
    @url = "https://api.donorschoose.org/common/"
    @path = path
    @params = {APIKey: ENV['donors_choose_api_key']}.merge(params)
  end

  def conn
    Faraday.new(@url)
  end

  def response
    response = conn.get(@path, @params)
    JSON.parse(response.body)
  end

  def campaigns
    response["proposals"]
  end
end
