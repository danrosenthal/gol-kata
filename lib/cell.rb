class Cell
  attr_reader :state, :number_of_living_neighbors
  def initialize(state, number_of_living_neighbors)
    @state = state
    @number_of_living_neighbors = number_of_living_neighbors
  end

  def self.live_state
    :living
  end
  def self.dead_state
    :dead
  end

  def living?
    @state == :living
  end
  def dead?
    @state == :dead
  end
  def live!
    @state = :living
  end
  def die!
    @state = :dead
  end

  def underpopulated?
   @number_of_living_neighbors < 2
  end
  def overcrowded?
    @number_of_living_neighbors > 3
  end
  def hospitable?
    @number_of_living_neighbors.between?(2,3)
  end
  def favorable?
    @number_of_living_neighbors == 3
  end

  def next_state?
    if (underpopulated? && living?)
      @state = :dead
    elsif (overcrowded? && living?)
      @state = :dead
    elsif (hospitable? && living?)
      @state = :living
    elsif (favorable? && dead?)
      @state = :living
    else
      @state = :dead
    end
  end
end
