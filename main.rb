# think of the problem like a binary tree. The tree has a "root position". The root has children. You must map these children, which is what forms the paths.
# in this case, the position of the knight is the current root. The children of that root are going to be each of the valid moves.

# 0_ _ _ _ _ _ _ _
# 1_ _ _ _ _ _ E _
# 2_ _ c _ c _ _ _
# 3_ c _ _ _ c _ _
# 4_ _ _ R _ _ _ _
# 5_ c _ _ _ c _ _
# 6_ _ c _ c _ _ _
# 7_ _ _ _ _ _ _ _
#  0 1 2 3 4 5 6 7

# so above, the R(oot) is[4][3], and the children are everywhere that R(oot) can move.
# The child would then become the next root, and the process would repeat
# this is you searching the "tree" and establishing the relationships
# you would need to define that if the child(?) is not between?(0, 7), it is not included in the search
# you would need to save each visited root, so if the child.eql(visited), it is not included again
# the End case is when root.eql?(end_position)

require_relative "lib/board"
require_relative "lib/knight"
