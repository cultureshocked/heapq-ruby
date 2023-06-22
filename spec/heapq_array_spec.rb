require_relative '../src/heapq_array.rb'

describe "Array::heapq::private" do
  context "Helper methods" do
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

  context "Heap actions" do

  end
end

describe "Array::heapq::public" do
  context "Min-heap:" do

  end

  context "Max-heap:" do

  end
end
