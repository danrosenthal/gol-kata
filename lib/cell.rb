class Cell
  attr_reader :state
  def initialize(state)
    @state = state
  end

  def define
    if living?
      :living
    elsif dead?
      :dead
    end
  end

  def living?
    @state == 1 
  end
  def dead?
    @state == 0
  end
  
  def live!
    @state = 1
  end
  def die!
    @state = 0
  end

end