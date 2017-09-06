#route between nodes
require_relative 'node'

def route_between_nodes?(node1, node2)
  stack = [node1]
  until stack.empty?
    current_node = stack.pop
    return true if current_node == node2
    current_node.children.each do |child|
      next if child.visited == true
      p child.value
      child.visited = true
      return true if child == node2
      stack.push(child)
    end
  end
  "no path"
end

def reset(nodes)
  nodes.each do |node|
    node.visited = false
  end
end

a = TreeNode.new(1)
b = TreeNode.new(2)
c = TreeNode.new(3)
d = TreeNode.new(4)
e = TreeNode.new(5)
f = TreeNode.new(6)
g = TreeNode.new(7)
h = TreeNode.new(8)
i = TreeNode.new(9)

all_nodes = [a, b, c, d, e, f, g, h, i]

a.children.push(b, c)
b.children.push(d, e, f)
c.children.push(g)
g.children.push(a)

p route_between_nodes?(a, f)
reset(all_nodes)
p route_between_nodes?(a, g)


# given a soreted array with unique integer elements,
# write an algorithm to create a binary search tree with minimal height
def minimal_tree(arr)
  mid_point = arr.length / 2
  current_node = TreeNode.new(arr[mid_point])
  left = arr[0...mid_point]
  right = arr[mid_point..-1]
  current_children = [current_node]

  while !left.empty? && !right.empty?
    current_children.pop

    current_children[0...current_children.length / 2].each do |child|
      child.right = TreeNode.new(left.pop)
      child.left = TreeNode.new(left.pop)
    end
    
    current_children[current_children.length / 2..-1].each do |child|
      child.left = TreeNode.new(right.shift)
      child.right = TreeNode.new(right.shift)
    end
  end

end
