require_relative "lib/a_star"
require_relative "lib/knight"

test = AStar.new
p test.knight_moves([0, 2], [3, 7])
