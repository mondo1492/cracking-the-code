class TreeNode
  attr_accessor :value, :children, :visited, :left, :right

  def initialize(value)
    @children = []
    @value = value
  end
end
