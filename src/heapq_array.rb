class Array
  def heapq_min_heapify()

  end

  def heapq_min_enqueue(n)

  end

  def heapq_min_deque()

  end

  def heapq_max_heapify()

  end

  def heapq_max_enqueue(n)

  end

  def heapq_max_deque()

  end

  def heapq_min_update(old_val, new_val)

  end

  def heapq_max_update(old_val, new_val)

  end

  # private #comment out while running tests

  def heapq_get_parent(n)
    return nil if n <= 0
    (n - 1) / 2
  end

  def heapq_get_children(n)
    return nil if n < 0
    children = [n * 2 + 1, n * 2 + 2]
    children.select { |child| child < self.length }
  end

  def heapq_bubble_min(idx)

  end

  def heapq_sink_min(idx)

  end

  def heapq_bubble_max(idx)

  end

  def heapq_sink_max(idx)

  end

  def heapq_smaller_child(arr)
    arr.each { |idx| return nil if idx >= self.length }
    return nil if arr.length == 0
    return arr[0] if arr.length == 1
    (self[arr[0]] < self[arr[1]]) ? arr[0] : arr[1]
  end

  def heapq_larger_child(arr)
    arr.each { |idx| return nil if idx >= self.length }
    return nil if arr.length == 0
    return arr[0] if arr.length == 1
    (self[arr[0]] > self[arr[1]]) ? arr[0] : arr[1]
  end
end
