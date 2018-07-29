class CampaignPresenter
  attr_reader :state
  def initialize(state)
    @state = state
  end

  def path
    "json_feed.html?&"
  end

  def params
    {state: @state}
  end

  def results
    DonorsChooseService.new(path, params).campaigns
  end

  def campaigns
    results.map do |result|
      Campaign.new(result)
    end
  end
end
