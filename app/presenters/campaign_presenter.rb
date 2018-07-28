class StorePresenter
  attr_reader :state
  def initialize(state)
    @state = state
  end

  def path
  end

  def params
    "{state: #{@state}}"
  end

  def results
  end
end
