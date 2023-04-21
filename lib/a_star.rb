require_relative "./knight"

class AStar
  # this takes a valid array for position and goal [0, 0] .. [7, 7] and returns the absolute value. In this case the "Manhattan distance" is used.
  def calculate_distance(position, goal)
    (position[0] - goal[0]).abs + (position[1] - goal[1]).abs
  end
end
