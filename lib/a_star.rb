require_relative "./knight"

class AStar
  attr_accessor :start, :goal, :open_list, :closed_list

  # this takes a starting array position [0,0] and the goal [0,0]
  # extract start and goal. They are coordinates, but not part of the algorithm directly?
  def initialize
    @start = start
    @goal = goal
    @open_list = []
    @closed_list = []
  end

  # Finds the shortest path from start to goal using A* algorithm
  def knight_moves(start, goal)
    self.start = start
    self.goal = goal
    # creates a knight node at the start array position.
    starting_node = new_node(start)

    open_list << starting_node

    until open_list.empty?
      current_node = open_list.min_by { |node| node.dist_sum }
      open_list.delete(current_node)
      closed_list << current_node

      return construct_path(current_node) if current_node.position == goal

      valid_moves = new_node(current_node.position).valid_moves

      valid_moves.each do |move|
        next if closed_list.any? { |node| node.position == move }

        start_dist = current_node.dist_from_start + 1
        goal_dist = distance_from_end(move)
        total_dist = start_dist + goal_dist

        existing_node = open_list.find { |node| node.position == move }
        if existing_node
          if start_dist < existing_node.dist_from_start
            existing_node.parent = current_node
            existing_node.dist_from_start = start_dist
            existing_node.dist_sum = total_dist
          end
        else
          node = new_node(move)
          node.parent = current_node
          node.dist_from_start = start_dist
          node.dist_from_goal = goal_dist
          node.dist_sum = total_dist
          open_list << node
        end
      end
    end

    nil  # no path found
  end

  private

  # this takes a valid array for position and goal [0, 0] .. [7, 7] and returns the absolute value. In this case the "Manhattan distance" is used.
  def distance_from_end(position)
    (position[0] - goal[0]).abs + (position[1] - goal[1]).abs
  end

  # Constructs the shortest path from the goal node to the start node recursively. node.position array adds next array onto the list, until no more parents found.
  def construct_path(node)
    return node.position if node.parent.nil?
    [node.position] + construct_path(node.parent)
  end

  # Creates a new node with the given position
  def new_node(position)
    Knight.new(position)
  end
end
