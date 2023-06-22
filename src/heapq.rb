module PriorityQueue
  def peek(arr)
    return nil if arr.class.name != "Array"
    arr[0]
  end

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

  def place(arr, idx)

  end
end
