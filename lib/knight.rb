class Knight
  KNIGHT_MOVE = [
    [1, 2], [2, 1], [-1, -2], [-2, -1],
    [-1, 2], [2, -1], [-2, 1], [1, -2]
  ].freeze

  attr_accessor :position, :parent, :dist_from_start, :dist_from_goal, :dist_sum
  def initialize(position, parent = nil)
    @position = position
    @parent = parent
    @dist_from_start = 0
    @dist_from_goal = 0
    @dist_sum = 0
  end

  # iterate over KNIGHT_MOVE. position of knight is [4, 3]
  # => [[6, 4], [5, 5], [2, 2], [3, 1], [2, 4], [5, 1], [3, 5], [6, 2]]
  def valid_moves(result = [])
    KNIGHT_MOVE.each do |move|
      x = position[0] + move[0]
      y = position[1] + move[1]
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result
  end
end
