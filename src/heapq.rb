module PriorityQueue
  def deque(arr)

  end

  def enqueue(arr, n)

  end

  def is_valid?(arr)

  end

  def get_parent_idx(n)
    return nil if n.class.name != "Integer" or n <= 0
    (n - 1) / 2
  end

  def get_left_child_idx(n)
    return nil if n.class.name != "Integer" or n <= 0
    2 * n + 1
  end

  def get_right_child_idx(n)
    return nil if n.class.name != "Integer" or n <= 0
    2 * n + 2
  end

  def bubble(arr, idx)

  end

  def sink(arr, idx)

  end

  def place(arr, idx)

  end
end
