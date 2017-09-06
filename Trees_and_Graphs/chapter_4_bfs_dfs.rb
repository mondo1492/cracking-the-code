#DFS
def dfs(root_node, target)
  return "No tree" if root_node.nil?
  stack = [root_node]
  until stack.empty?
    current_node = stack.pop
    return current_node if target == current_node.value
    current_node.children.each do |child|
      stack.push(child)
    end

    #for binary tree use...
    # stack.push(current_node.left) if current_node.left
    # stack.push(current_node.right) if current_node.right
  end
end

#BFS
def bfs(root_node, target)
  return "No tree" if root_node.nil?
  q = [root_node]
  until q.empty?
    current_node = q.shift
    return current_node if target == current_node.value
    current_node.children.each do |child|
      q.push(child)
    end
  end
  "Target not found"
end
