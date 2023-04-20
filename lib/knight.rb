class Knight
  KNIGHT_MOVE = [
    [2, 1], [1, 2], [-2, -1], [-1, -2],
    [-2, 1], [1, -2], [-1, 2], [2, -1]
  ].freeze

  attr_accessor :position, :children

  def initialize(position)
    self.position = position
    self.children = []
  end

  # iterate over KNIGHT_MOVE. position of knight is [0]
  def valid_moves
    KNIGHT_MOVE.each do |ea|
    end
  end
end
