class Campaign
  attr_reader :prop

  def initialize(prop)
    @prop = prop
  end

  def title
    @prop['title']
  end

  def url
    @prop["fundURL"]
  end
#future calculation to be made with a distance calculator(likely the decorater)
  def stamp
    "National"
  end

  def percent_funded
    "#{@prop["percentFunded"]}%"
  end
end
