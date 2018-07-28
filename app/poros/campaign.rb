class Campaign
  attr_reader :proposal

  def initialize(proposal)
    @proposal = proposal
  end

  def title
    @proposal['title']
  end

  def url
    @proposal["proposalURL"]
  end
#future calculation to be made with a distance calculator(likely the decorater)
  def stamp
    "National"
  end

  def percent_funded
    "#{@proposal["percentFunded"]}%"
  end
end
