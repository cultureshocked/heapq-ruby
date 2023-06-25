require_relative '../src/heapq_array.rb'

# Wrapper class for the data I want to heapify
class DijkstraData
  include Comparable
  attr_accessor :distance, :visited, :prev
  attr_reader :node
  def initialize(node, visited=false, distance=Float::INFINITY)
    @node = node
    @visited = visited
    @distance = distance
    @prev = nil
  end

  # Must include Comparable for object's use in minheap
  # I would advise against mixing types in the heap, but if it's the only way, then so be it.
  # At least handle what you're comparing to like I did in this override
  def <=>(other)
    if (other.class.name == "DijkstraData")
      return @distance <=> other.distance
    end
    @distance <=> other
  end
end

# Effectively what an edge is
Connection = Struct.new(:to, :dist)

# Adjacency list
network = [
  [
    Connection.new(1, 3)
  ],
  [
    Connection.new(3, 2),
    Connection.new(5, 9)
  ],
  [
    Connection.new(0, 2)
  ],
  [
    Connection.new(1, 1),
    Connection.new(2, 3),
    Connection.new(4, 4),
    Connection.new(5, 6)
  ],
  [
    Connection.new(3, 4),
    Connection.new(5, 3)
  ],
  [
    Connection.new(4, 3)
  ]
]

# This may not be the most optimized solution, but this was how I first learned dijkstra's algorithm,
# but this time I'm using a minheap instead of an array.
def dijkstra_adj_list_minheap(adj_list, src, dest)
  return nil unless src.between?(0, adj_list.length - 1) and dest.between?(0, adj_list.length - 1)
  return [src] if src == dest

  # generate node data in class wrapper
  nodes = []
  visited = []
  adj_list.each.with_index do |node, idx|
    if idx == src
      nodes << DijkstraData.new(src, true, 0)
      next
    end
    nodes << DijkstraData.new(idx)
  end

  #duplicate, because we will use nodes as a hashmap of sorts for faster updates
  minheap = nodes.heapq_min_heapify # duplication shallow-copies the DijkstraData objects

  #the algorithm
  while minheap.length > 0
    visited << minheap.heapq_min_deque
    visited[-1].visited = true
    current_node = visited[-1].node
    for edge in adj_list[current_node]
      # objects are also updated in minheap, but we need to re-heapify!
      next if visited.include?(nodes[edge.to])
      next if nodes[edge.to].distance < visited[-1].distance + edge.dist
      nodes[edge.to].distance = visited[-1].distance + edge.dist
      nodes[edge.to].prev = visited[-1].node
    end
    #reheapify in place
    minheap.heapq_min_heapify!
  end

  #backtracking to generate the path to the destination
  path = [dest]
  last_node = nodes[dest]
  until last_node.prev.nil?
    path << last_node.prev # append is faster than unshift
    last_node = nodes[last_node.prev]
  end

  return path.reverse #because we were using append instead of unshift before, we need to reverse it.
end

p dijkstra_adj_list_minheap(network, 0, 5)
