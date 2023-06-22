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
