require_relative '../src/heapq.rb'
include PriorityQueue

describe "get_parent_idx" do
  context "with valid input:" do
    it "should return the index of the parent of an index greater than zero" do
      expect(get_parent_idx 2).to eql(0)
      expect(get_parent_idx 5).to eql(2)
      expect(get_parent_idx 11).to eql(5)
    end
    it "should return nil for 0" do
      expect(get_parent_idx 0).to eql(nil)
    end
  end

  context "with invalid input" do
    it "should return nil for non-integer classes" do
      expect(get_parent_idx "hi").to eql(nil)
    end
    it "should return nil for negative integers" do
      expect(get_parent_idx -1).to eql(nil)
    end
  end
end

describe "get_left_child_idx" do
  context "with valid input:" do
    it "should return the index of the left child element" do
      expect(get_left_child_idx 2).to eql(5)
      expect(get_left_child_idx 5).to eql(11)
      expect(get_left_child_idx 11).to eql(23)
    end
  end

  context "with invalid input:" do
    it "should return nil for non-integer classes" do
      expect(get_left_child_idx "hi").to eql(nil)
    end
    it "should return nil for negative integers" do
      expect(get_left_child_idx -1).to eql(nil)
    end
  end
end

describe "get_right_child_idx" do
  context "with valid input:" do
    it "should return the index of the left child element" do
      expect(get_right_child_idx 2).to eql(6)
      expect(get_right_child_idx 5).to eql(12)
      expect(get_right_child_idx 11).to eql(24)
    end
  end

  context "with invalid input:" do
    it "should return nil for non-integer classes" do
      expect(get_right_child_idx "hi").to eql(nil)
    end
    it "should return nil for negative integers" do
      expect(get_right_child_idx -1).to eql(nil)
    end
  end
end

describe "peek" do
  context "with valid input:" do
    it "should return the first element in the array without removing it" do
      minheap = [0, 1, 2, 3, 4, 5]
      expect(peek minheap).to eql(0)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5])
    end
    it "should return the element when there is only one element in the minheap" do
      minheap = [1]
      expect(peek minheap).to eql(1)
      expect(minheap).to eql([1])
    end
  end

  context "with invalid input:" do
    it "should return nil for non-array classes" do
      expect(peek "hi").to eql(nil)
    end
    it "should return nil for empty arrays" do
      expect(peek []).to eql(nil)
    end
  end
end

describe "bubble" do
  context "with valid input:" do
    it "should bubble-up a number if it is smaller than its parent" do
      minheap = [0, 1, 5, 3, 4, 2, 6]
      expect(bubble minheap, 5).to eql(2)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "should do nothing if the number is at the top of the minheap" do
      minheap = [1]
      expect(bubble minheap, 0).to eql(0)
      expect(minheap).to eql([1])
    end
    it "should bubble all the way to index 0" do
      minheap = [1, 2, 3, 4, 5, 0, 7]
      expect(bubble minheap, 5).to eql(0)
      expect(minheap).to eql([0, 2, 1, 4, 5, 3, 7])
    end
  end

  context "with invalid input:" do
    it "should do nothing + return nil for non-array classes" do
      minheap = "hi"
      expect(bubble minheap, 3).to eql(nil)
      expect(minheap).to eql("hi")
    end
    it "should do nothing + return nil for empty heaps" do
      minheap = []
      expect(bubble [], 3).to eql(nil)
      expect(minheap).to eql([])
    end
    it "should do nothing + return nil for a negative index" do
      minheap = [0, 1, 5, 3, 4, 2, 6]
      expect(bubble minheap, -1).to eql(nil)
      expect(minheap).to eql([0, 1, 5, 3, 4, 2, 6])
    end
    it "should do nothing + return nil for out-of-bounds index" do
      minheap = [0, 1, 5, 3, 4, 2, 6]
      expect(bubble minheap, 8).to eql(nil)
      expect(minheap).to eql([0, 1, 5, 3, 4, 2, 6])
    end
  end
end

describe "sink" do
  context "with valid input:" do
    it "sinks a value + returns its new index if it is larger than one of its children" do
      minheap = [1, 0, 2, 3, 4, 5, 6]
      expect(sink minheap, 0).to eql(1)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "sinks a value +returns its new index if it is larger than both of its children" do
      minheap = [5, 1, 0, 3, 4, 2, 6]
      expect(sink minheap, 0).to eql(5)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "does nothing + returns current index if a value is smaller than its children" do
      minheap = [0, 1, 2, 3, 4, 5, 6]
      expect(sink minheap, 2).to eql(2)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "does nothing + returns current index if a value has no children" do
      minheap = [0, 1, 2, 3, 4, 5, 6]
      expect(sink minheap, 6).to eql(6)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
  end
  context "with invalid input:" do
    it "does nothing + returns nil if the heap is not an array" do
      minheap = "hi"
      expect(sink minheap, 0).to eql(nil)
      expect(minheap).to eql("hi")
    end
    it "does nothing + returns nil if the index is out of bounds" do
      minheap = [0, 1, 2, 3, 4, 5, 6]
      expect(sink minheap, 9).to eql(nil)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "does nothing + returns nil if the index is not an integer" do
      minheap = [0, 1, 2, 3, 4, 5, 6]
      expect(sink minheap, "hi").to eql(nil)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
    it "does nothing + returns nil if the index is negative" do
      minheap = [0, 1, 2, 3, 4, 5, 6]
      expect(sink minheap, -1).to eql(nil)
      expect(minheap).to eql([0, 1, 2, 3, 4, 5, 6])
    end
  end
end

describe "is_valid?" do
  context "with valid input:" do
    it "returns true for a valid minheap" do
      minheap = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
      expect(is_valid? minheap).to eql(true)
    end
    it "returns false for an invalid minheap" do
      minheap = [0, 1, 2, 3, 4, 20, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
      expect(is_valid? minheap).to eql(false)
    end
    it "returns true for a minheap of one item" do
      minheap = [0]
      expect(is_valid? minheap).to eql(true)
    end
    it "returns true for an empty minheap" do
      minheap = []
      expect(is_valid? minheap).to eql(true)
    end
  end

  context "with invalid input:" do
    it "returns false if argument is not an array" do
      minheap = "hi"
      expect(is_valid? minheap).to eql(false)
    end
  end
end
