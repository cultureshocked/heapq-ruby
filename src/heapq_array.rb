class Array
  def heapq_min_heapify()
    return_array = self.clone
    for i in 0...return_array.length
      next if i == 0
      return_array.heapq_min_bubble i
    end
    return_array
  end

  def heapq_min_heapify!()
    for i in 0...self.length
      next if i == 0
      heapq_min_bubble i
    end
    self
  end

  def heapq_min_enqueue(n)
    return nil if n.nil?
    idx = self.index n
    return idx unless idx.nil?
    self << n
    heapq_min_bubble self.length - 1
  end

  def heapq_min_deque()
    return nil if self.length == 0
    return self.pop if self.length == 1
    ret = self[0]
    tmp = self.pop
    self[0] = tmp
    heapq_min_sink 0
    ret
  end

  def heapq_min_update(old_val, new_val)
    return nil if old_val.nil? or new_val.nil?
    idx = self.index old_val
    return nil if idx.nil?
    new_idx = self.index new_val
    return new_idx unless new_idx.nil?

    self[idx] = new_val

    if old_val > new_val
      return heapq_min_bubble idx
    else
      return heapq_min_sink idx
    end
  end

  def heapq_max_heapify()

  end

  def heapq_max_heapify!()

  end

  def heapq_max_enqueue(n)

  end

  def heapq_max_deque()

  end

  def heapq_max_update(old_val, new_val)

  end

  def heapq_peek()
    self[0]
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

  def heapq_min_bubble(idx)
    return nil unless idx.between?(0, self.length - 1)
    return 0 if idx == 0
    parent = heapq_get_parent idx
    return idx if self[parent] < self[idx]
    self[parent], self[idx] = self[idx], self[parent]
    heapq_min_bubble parent
  end

  def heapq_min_sink(idx)
    return nil unless idx.between?(0, self.length - 1)
    children = heapq_get_children idx
    return idx if children.length == 0

    #one child to sink
    if children.length == 1
      child = children[0]
      return idx if self[child] > self[idx]
      self[child], self[idx] = self[idx], self[child]
      return heapq_min_sink child
    end

    #two children
    child = heapq_smaller_child children
    return idx if self[child] > self[idx]
    self[child], self[idx] = self[idx], self[child]
    heapq_min_sink child
  end

  def heapq_max_bubble(idx)
    return nil unless idx.between?(0, self.length - 1)
    return 0 if idx == 0
    parent = heapq_get_parent idx
    return idx if self[parent] > self[idx]
    self[parent], self[idx] = self[idx], self[parent]
    heapq_max_bubble parent
  end

  def heapq_max_sink(idx)
    return nil unless idx.between?(0, self.length - 1)
    children = heapq_get_children idx
    return idx if children.length == 0

    #one child to sink
    if children.length == 1
      child = children[0]
      return idx if self[child] < self[idx]
      self[child], self[idx] = self[idx], self[child]
      return heapq_max_sink child
    end

    #two children
    child = heapq_larger_child children
    return idx if self[child] < self[idx]
    self[child], self[idx] = self[idx], self[child]
    heapq_max_sink child
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
