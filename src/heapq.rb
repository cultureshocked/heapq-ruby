module PriorityQueue
  def peek(arr)
    return nil if arr.class.name != "Array"
    arr[0]
  end

  def deque(arr)
    return nil if arr.class.name != "Array" or arr.length == 0
    tmp = arr[0]
    if arr.length == 1
      arr.pop
      return tmp
    end
    arr[0] = arr.pop
    sink arr, 0
    return tmp
  end

  def enqueue(arr, n)
    return nil if arr.class.name != "Array"
    idx = arr.index n
    unless idx
      arr << n
      return bubble(arr, arr.length - 1)
    end
    idx
  end

  def is_valid?(arr)
    return false if arr.class.name != "Array"
    arr.each.with_index do |n, idx|
      next if idx == 0 # ignore first element as it has no parent
      parent_idx = get_parent_idx idx
      return false if arr[parent_idx] > arr[idx]
    end
    true
  end

  def get_parent_idx(n)
    return nil if n.class.name != "Integer" or n <= 0
    (n - 1) / 2
  end

  def get_left_child_idx(n)
    return nil if n.class.name != "Integer" or n < 0
    2 * n + 1
  end

  def get_right_child_idx(n)
    return nil if n.class.name != "Integer" or n < 0
    2 * n + 2
  end

  def bubble(arr, idx)
    return nil if arr.class.name != "Array" or idx.class.name != "Integer"
    return nil unless (idx.between?(0, arr.length - 1))
    return 0 if idx == 0
    parent_idx = get_parent_idx idx
    if arr[parent_idx] > arr[idx]
      arr[parent_idx], arr[idx] = arr[idx], arr[parent_idx]
      return bubble arr, parent_idx
    end
    idx
  end

  def sink(arr, idx)
    return nil if arr.class.name != "Array" or idx.class.name != "Integer"
    return nil unless (idx.between?(0, arr.length - 1))

    l_child = get_left_child_idx idx
    r_child = get_right_child_idx idx

    return idx if l_child >= arr.length #no children

    if r_child >= arr.length # only one child available
      if (arr[idx] > arr[l_child])
        arr[idx], arr[l_child] = arr[l_child], arr[idx]
        return sink arr, l_child
      end
      return idx
    end

    #two children
    smallest_child = (arr[l_child] < arr[r_child]) ? l_child : r_child # which child has smaller value
    return idx if arr[smallest_child] > arr[idx] #both children are larger than value at idx

    arr[smallest_child], arr[idx] = arr[idx], arr[smallest_child]
    sink arr, smallest_child
  end

  def update(arr, old_value, new_value)

  end
end
