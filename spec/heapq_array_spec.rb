require_relative '../src/heapq_array.rb'

describe "Array::heapq::private =>" do
  context "Helper methods =>" do
    it "#heapq_get_parent(): gets the index of the parent value" do
      arr = []
      expect(arr.heapq_get_parent 5).to eql(2)
      expect(arr.heapq_get_parent 2).to eql(0)
      expect(arr.heapq_get_parent 10).to eql(4)
      expect(arr).to eql([])
    end
    it "#heapq_get_parent(): returns nil if there is no parent value (index 0):" do
      arr = []
      expect(arr.heapq_get_parent 0).to eql(nil)
      expect(arr).to eql([])
    end
    it "#heapq_get_children(): returns nil if the index supplied is negative" do
      arr = []
      expect(arr.heapq_get_children -1).to eql(nil)
      expect(arr).to eql([])
    end
    it "#heapq_get_children(): returns the indices of children of a value if they are within range" do
      arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
      expect(arr.heapq_get_children 2).to eql([5, 6])
      expect(arr.heapq_get_children 0).to eql([1, 2])
      expect(arr.heapq_get_children 5).to eql([11, 12])
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
    end
    it "#heapq_get_children(): returns an empty array if there are no children within range of the array" do
      arr = [0, 1, 2, 3, 4]
      expect(arr.heapq_get_children 2).to eql([])
      expect(arr.heapq_get_children 3).to eql([])
      expect(arr).to eql([0, 1, 2, 3, 4])
    end
    it "#heapq_get_children(): returns an array of size 1 if there is only one child in range" do
      arr = [0, 1, 2, 3, 4, 5]
      expect(arr.heapq_get_children 2).to eql([5])
      expect(arr).to eql([0, 1, 2, 3, 4, 5])
    end
    it "#heapq_smaller_child(): returns nil if at least one index is out of range" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_smaller_child [6, 7]).to eql(nil)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_smaller_child(): returns the only value in the array if only one is supplied" do
      arr = [0, 1, 2, 3, 4, 5]
      expect(arr.heapq_smaller_child [5]).to eql(5)
      expect(arr).to eql([0, 1, 2, 3, 4, 5])
    end
    it "#heapq_smaller_child(): returns the index of the smaller child value" do
      arr_a = [0, 1, 2, 3, 4, 5, 6]
      arr_b = [0, 1, 2, 3, 4, 6, 5]
      expect(arr_a.heapq_smaller_child [5, 6]).to eql(5)
      expect(arr_b.heapq_smaller_child [5, 6]).to eql(6)
      expect(arr_a).to eql([0, 1, 2, 3, 4, 5, 6])
      expect(arr_b).to eql([0, 1, 2, 3, 4, 6, 5])
    end
    it "#heapq_larger_child(): returns nil if at least one index is out of range" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_larger_child [6, 7]).to eql(nil)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_larger_child(): returns the only value in the array if only one is supplied" do
      arr = [0, 1, 2, 3, 4, 5]
      expect(arr.heapq_larger_child [5]).to eql(5)
      expect(arr).to eql([0, 1, 2, 3, 4, 5])
    end
    it "#heapq_larger_child(): returns the index of the larger child value" do
      arr_a = [0, 1, 2, 3, 4, 5, 6]
      arr_b = [0, 1, 2, 3, 4, 6, 5]
      expect(arr_a.heapq_larger_child [5, 6]).to eql(6)
      expect(arr_b.heapq_larger_child [5, 6]).to eql(5)
      expect(arr_a).to eql([0, 1, 2, 3, 4, 5, 6])
      expect(arr_b).to eql([0, 1, 2, 3, 4, 6, 5])
    end
  end

  context "Heap actions =>" do
    #BUBBLE
    #MIN
    it "#heapq_min_bubble(): bubbles up a value to where it belongs + returns new index" do
      arr = [0, 1, 5, 3, 4, 2, 6]
      expect(arr.heapq_min_bubble 5).to eql(2)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_min_bubble(): bubbles up a value to the top if needed + returns new index" do
      arr = [1, 2, 3, 4, 5, 0, 7]
      expect(arr.heapq_min_bubble 5).to eql(0)
      expect(arr).to eql([0, 2, 1, 4, 5, 3, 7])
    end
    it "#heapq_min_bubble(): does nothing if the value is where it belongs + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_bubble 2).to eql(2)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_min_bubble(): does nothing if the value is already at the top + returns 0" do
      arr = [0]
      expect(arr.heapq_min_bubble 0).to eql(0)
      expect(arr).to eql([0])
    end
    it "#heapq_min_bubble(): returns nil if the index is out of bounds/negative" do
      arr = [0]
      expect(arr.heapq_min_bubble 2).to eql(nil)
      expect(arr.heapq_min_bubble -1).to eql(nil)
      expect(arr).to eql([0])
    end
    #MAX
    it "#heapq_max_bubble(): bubbles up a value to where it belongs + returns new index" do
      arr = [6, 5, 2, 3, 1, 4, 0]
      expect(arr.heapq_max_bubble 5).to eql(2)
      expect(arr).to eql([6, 5, 4, 3, 1, 2, 0])
    end
    it "#heapq_max_bubble(): bubbles up a value to the top if needed + returns new index" do
      arr = [5, 4, 3, 2, 1, 0, 6]
      expect(arr.heapq_max_bubble 6).to eql(0)
      expect(arr).to eql([6, 4, 5, 2, 1, 0, 3])
    end
    it "#heapq_max_bubble(): does nothing if the value is where it belongs + returns its index" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_bubble 2).to eql(2)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_bubble(): does nothing if the value is already at the top + returns 0" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_bubble 0).to eql(0)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_bubble(): returns nil if the index is out of bounds" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_bubble -1).to eql(nil)
      expect(arr.heapq_max_bubble 10).to eql(nil)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end

    #SINK
    #MIN
    it "#heapq_min_sink(): sinks a value down if it is larger than 1 of its children + returns new index" do
      arr = [1, 0, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_sink 0).to eql(1)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_min_sink(): sinks a value down if it is larger than both of its children + returns its index" do
      arr = [5, 1, 0, 3, 4, 2, 6]
      expect(arr.heapq_min_sink 0).to eql(5)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_min_sink(): does nothing if the value is larger than both children + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_sink 2).to eql(2)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "#heapq_min_sink(): does nothing if the value has no children + returns index" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_sink 5).to eql(5)
    end
    it "#heapq_min_sink(): returns nil if the index is out of bounds/negative" do
      arr = [0]
      expect(arr.heapq_min_sink 1).to eql(nil)
      expect(arr.heapq_min_sink -1).to eql(nil)
      expect(arr).to eql([0])
    end
    #MAX
    it "#heapq_max_sink(): sinks a value down if it is smaller than one of its children + returns new index" do
      arr = [5, 6, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_sink 0).to eql(1)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_sink(): sinks a value down if it is smaller than both its children + returns its index" do
      arr = [0, 6, 5, 4, 3, 2, 1]
      expect(arr.heapq_max_sink 0).to eql(3)
      expect(arr).to eql([6, 4, 5, 0, 3, 2, 1])
    end
    it "#heapq_max_sink(): does nothing if value is larger than both children + returns its index" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_sink 2).to eql(2)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_sink(): does nothing if the value has no children + returns index" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_sink 5).to eql(5)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_sink(): returns nil if the index is out of bounds/negative" do
      arr = [0]
      expect(arr.heapq_max_sink 1).to eql(nil)
      expect(arr.heapq_max_sink -1).to eql(nil)
      expect(arr).to eql([0])
    end
  end
end

describe "Array::heapq::public =>" do
  context "Min-heap =>" do
    #ENQUEUE
    it "#heapq_min_enqueue(): enqueue's an object at the end of the array + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_enqueue 7).to eql(7)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6, 7])
    end
    it "#heapq_min_enqueue(): enqueue's an object and places it in the heap + returns its index" do
      arr = [0, 1, 5, 3, 4, 6]
      expect(arr.heapq_min_enqueue 2).to eql(2)
      expect(arr).to eql([0, 1, 2, 3, 4, 6, 5])
    end
    it "#heapq_min_enqueue(): does nothing if the value is already in the heap + returns existing index" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_enqueue 8).to eql(4)
      expect(arr).to eql([0, 2, 4, 6, 8, 10, 12])
    end
    it "#heapq_min_enqueue(): places the object at the top of the heap if it is the smallest" do
      arr = [1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_enqueue 0).to eql(0)
      expect(arr).to eql([0, 2, 1, 4, 5, 6, 3])
    end
    it "#heapq_min_enqueue(): does nothing if the object is nil + returns nil" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_enqueue nil).to eql(nil)
      expect(arr).to eql([0, 1, 2, 3, 4, 5, 6])
    end

    #DEQUE
    it "#heapq_min_deque(): deletes/returns the smallest object in the heap + heapifies" do
      arr = [0, 1, 2, 3, 4, 5, 6]
      expect(arr.heapq_min_deque).to eql(0)
      expect(arr).to eql([1, 3, 2, 6, 4, 5])
    end
    it "#heapq_min_deque(): deletes/returns the only object in the heap is size == 1" do
      arr = [0]
      expect(arr.heapq_min_deque).to eql(0)
      expect(arr).to eql([])
    end
    it "#heapq_min_deque(): returns nil if the heap is empty" do
      arr = []
      expect(arr.heapq_min_deque).to eql(nil)
      expect(arr).to eql([])
    end

    #HEAPIFY (SAFE)
    it "#heapq_min_heapify(): returns a new heap from a regular array" do
      arr = [5, 4, 7, 2, 6, 9, 3]
      heap = arr.heapq_min_heapify
      expect(heap.equal? arr).to eql(false)
      expect(arr).to eql([5, 4, 7, 2, 6, 9, 3])
      expect(heap).to eql([2, 4, 3, 5, 6, 9, 7])
    end
    it "#heapq_min_heapify(): returns an empty array if the source array is empty" do
      arr = []
      heap = arr.heapq_min_heapify
      expect(heap).to eql([])
      expect(arr).to eql([])
      expect(heap.equal? arr).to eql(false)
    end
    it "#heapq_min_heapify(): deletes any duplicates in the array before building the heap" do
      arr = [5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3]
      heap = arr.heapq_min_heapify
      expect(heap.equal? arr).to eql(false)
      expect(arr).to eql([5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3])
      expect(heap).to eql([2, 4, 3, 5, 6, 9, 7])
    end

    #HEAPIFY (UNSAFE)
    it "#heapq_min_heapify!(): turns the source array into a min-heap in-place + returns itself" do
      arr = [5, 4, 7, 2, 6, 9, 3]
      heap = arr.heapq_min_heapify!
      expect(arr.equal? heap).to eql(true)
      expect(arr).to eql([2, 4, 3, 5, 6, 9, 7])
    end
    it "#heapq_min_heapify!(): does nothing on an empty array" do
      arr = []
      heap = arr.heapq_min_heapify!
      expect(arr.equal? heap).to eql(true)
      expect(heap).to eql([])
    end
    it "#heapq_min_heapify!(): deletes any duplicates in the array before building the heap" do
      arr = [5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3]
      heap = arr.heapq_min_heapify!
      expect(heap.equal? arr).to eql(true)
      expect(heap).to eql([2, 4, 3, 5, 6, 9, 7])
    end

    #UPDATE
    it "#heapq_min_update(): updates the existing value and does nothing if it fits + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update 4, 3).to eql(2)
      expect(arr).to eql([0, 2, 3, 6, 8, 10, 12])
    end
    it "#heapq_min_update(): updates the existing value and sinks it if needed + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update 4, 11).to eql(5)
      expect(arr).to eql([0, 2, 10, 6, 8, 11, 12])
    end
    it "#heapq_min_update(): updates the existing value and bubbles it if needed + returns its index" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update 4, -1).to eql(0)
      expect(arr).to eql([-1, 2, 0, 6, 8, 10, 12])
    end
    it "#heapq_min_update(): returns nil + does nothing if the existing value is not found" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update 7, 9).to eql(nil)
      expect(arr).to eql([0, 2, 4, 6, 8, 10, 12])
    end
    it "#heapq_min_update(): returns the index of the new value if it already exists in the heap" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update 4, 8).to eql(4)
      expect(arr).to eql([0, 2, 4, 6, 8, 10, 12])
    end
    it "#heapq_min_update(): returns nil if any parameter is nil" do
      arr = [0, 1, 2, 3, 4, 5, 6].map { |n| n * 2 }
      expect(arr.heapq_min_update nil, 3).to eql(nil)
      expect(arr.heapq_min_update 2, nil).to eql(nil)
      expect(arr.heapq_min_update nil, nil).to eql(nil)
      expect(arr).to eql([0, 2, 4, 6, 8, 10, 12])
    end
  end

  context "Max-heap =>" do
    #ENQUEUE
    it "#heapq_max_enqueue(): enqueue's an object at the end of the array + returns its index" do
      arr = [6, 5, 4, 3, 2, 1]
      expect(arr.heapq_max_enqueue 0).to eql(6)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_enqueue(): enqueue's an object and places it in the heap + returns its index" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_enqueue 9).to eql(3)
      expect(arr).to eql([12, 10, 8, 9, 4, 2, 0, 6])
    end
    it "#heapq_max_enqueue(): does nothing if the value is already in the heap + returns its index" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_enqueue 4).to eql(2)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end
    it "#heapq_max_enqueue(): places the object at the top of the heap if it's the largest" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_enqueue 7).to eql(0)
      expect(arr).to eql([7, 6, 4, 5, 2, 1, 0, 3])
    end
    it "#heapq_max_enqueue(): does nothing if the object is nil + returns nil" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_enqueue nil).to eql(nil)
      expect(arr).to eql([6, 5, 4, 3, 2, 1, 0])
    end

    #DEQUE
    it "#heapq_max_deque(): deletes/returns the largest element + heapifies" do
      arr = [6, 5, 4, 3, 2, 1, 0]
      expect(arr.heapq_max_deque).to eql(6)
      expect(arr).to eql([5, 3, 4, 0, 2, 1])
    end
    it "#heapq_max_deque(): deletes/returns the only object if heap size == 1" do
      arr = [6]
      expect(arr.heapq_max_deque).to eql(6)
      expect(arr).to eql([])
    end
    it "#heapq_max_deque(): does nothing + returns nil if the heap is empty" do
      arr = []
      expect(arr.heapq_max_deque).to eql(nil)
      expect(arr).to eql([])
    end

    #HEAPIFY (SAFE)
    it "heapq_max_heapify(): returns a new heap from a regular array" do
      arr = [5, 4, 7, 2, 6, 9, 3]
      heap = arr.heapq_max_heapify
      expect(heap.equal? arr).to eql(false)
      expect(arr).to eql([5, 4, 7, 2, 6, 9, 3])
      expect(heap).to eql([9, 6, 7, 2, 4, 5, 3])
    end
    it "heapq_max_heapify(): returns an empty array if the source array is empty" do
      arr = []
      heap = arr.heapq_max_heapify
      expect(heap).to eql([])
      expect(arr).to eql([])
      expect(heap.equal? arr).to eql(false)
    end
    it "heapq_max_heapify(): deletes any duplicates in the original array while building heap" do
      arr = [5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3]
      heap = arr.heapq_max_heapify
      expect(heap.equal? arr).to eql(false)
      expect(arr).to eql([5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3])
      expect(heap).to eql([9, 6, 7, 2, 4, 5, 3])
    end
    #HEAPIFY (UNSAFE)
    it "heapq_max_heapify!(): turns the source array into a heap in-place + returns itself" do
      arr = [5, 4, 7, 2, 6, 9, 3]
      heap = arr.heapq_max_heapify!
      expect(heap.equal? arr).to eql(true)
      expect(arr).to eql([9, 6, 7, 2, 4, 5, 3])
      expect(heap).to eql([9, 6, 7, 2, 4, 5, 3])
    end
    it "heapq_max_heapify!(): does nothing and returns itself is the source array is empty" do
      arr = []
      heap = arr.heapq_max_heapify!
      expect(heap).to eql([])
      expect(arr).to eql([])
      expect(arr.equal? heap).to eql(true)
    end
    it "heapq_max_heapify!(): deletes any duplicates in the original array while building heap" do
      arr = [5, 4, 7, 7, 7, 2, 2, 6, 2, 9, 3]
      heap = arr.heapq_max_heapify!
      expect(heap.equal? arr).to eql(true)
      expect(arr).to eql([9, 6, 7, 2, 4, 5, 3])
      expect(heap).to eql([9, 6, 7, 2, 4, 5, 3])
    end

    #UPDATE
    it "#heapq_max_update(): updates the existing value and does nothing if it fits + returns the index" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update 4, 3).to eql(4)
      expect(arr).to eql([12, 10, 8, 6, 3, 2, 0])
    end
    it "#heapq_max_update(): updates the existing value and sinks it if needed + returns the index" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update 8, 1).to eql(5)
      expect(arr).to eql([12, 10, 2, 6, 4, 1, 0])
    end
    it "#heapq_max_update(): updates the existing value and bubbles it if needed + returns the index" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update 2, 14).to eql(0)
      expect(arr).to eql([14, 10, 12, 6, 4, 8, 0])
    end
    it "#heapq_max_update(): does nothing + returns nil if the old value is not found" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update 3, 11).to eql(nil)
      expect(arr).to eql([12, 10, 8, 6, 4, 2, 0])
    end
    it "#heapq_max_update(): returns the existing index of the new value if it is already in the heap" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update 2, 10).to eql(1)
      expect(arr).to eql([12, 10, 8, 6, 4, 2, 0])
    end
    it "#heapq_max_update(): returns nil and does nothing if either argument is nil" do
      arr = [6, 5, 4, 3, 2, 1, 0].map { |n| n * 2 }
      expect(arr.heapq_max_update nil, 3).to eql(nil)
      expect(arr.heapq_max_update 4, nil).to eql(nil)
      expect(arr.heapq_max_update nil, nil).to eql(nil)
      expect(arr).to eql([12, 10, 8, 6, 4, 2, 0])
    end
  end

  context "General =>" do
    it "#heapq_peek(): returns the top-most item in the heap without deleting it" do
      arr = [0, 1, 2, 3, 4]
      expect(arr.heapq_peek).to eql(0)
      expect(arr).to eql([0, 1, 2, 3, 4])
    end
    it "#heapq_peek(): returns nil if the heap is empty" do
      arr = []
      expect(arr.heapq_peek).to eql(nil)
      expect(arr).to eql([])
    end
  end
end
