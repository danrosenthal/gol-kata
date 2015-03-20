class Cell
  attr_reader :state, :number_of_living_neighbors
  def initialize(state, number_of_living_neighbors)
    @state = state
    @number_of_living_neighbors = number_of_living_neighbors
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
   number_of_living_neighbors < 2
  end
  def overcrowded?
    number_of_living_neighbors > 3
  end
  def hospitable?
    number_of_living_neighbors.between?(2,3)
  end
  def favorable?
    number_of_living_neighbors == 3
  end

  def set_next_state!
    if (underpopulated? && living?)
      die!
    elsif (overcrowded? && living?)
      die!
    elsif (hospitable? && living?)
      live!
    elsif (favorable? && dead?)
      live!
    end
  end
end
