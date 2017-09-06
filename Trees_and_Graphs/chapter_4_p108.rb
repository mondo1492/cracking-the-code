#Bidirectional Search
#Find the shortest path between a source and destination node.
#It operates by essentially running two simultanerous bfs

def bidirectional_search(source, destination)
  root1 = source
  root2 = destination
  q1 = [root1]
  q2 = [root2]
  path_steps = 0

  until q1.empty? || q2.empty?
    current_node_1 = q1.shift
    current_node_2 = q2.shift
    return path_steps if q1.include?(current_node_1)
    current_node_1.children.each do |child|
      q1.push(child)
    end
    current_node_2.children.each do |child|
      q2.push(child)
    end
    path_steps += 1
  end
  "No path found"
end
