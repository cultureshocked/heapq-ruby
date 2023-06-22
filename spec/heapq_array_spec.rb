require_relative '../src/heapq_array.rb'

describe "Array::heapq::private" do
  context "Helper methods" do
    it "#heapq_get_parent(): gets the index of the parent value" do

    end
    it "#heapq_get_parent(): returns nil if there is no parent value (index 0):" do

    end
    it "#heapq_get_children(): returns the indices of children of a value if they are within range" do

    end
    it "#heapq_get_children(): returns an empty array if there are no children within range of the array" do

    end
    it "#heapq_get_children(): returns an array of size 1 if there is only one child in range" do

    end
    it "#heapq_smaller_child(): returns nil if at least one index is out of range" do

    end
    it "#heapq_smaller_child(): returns the only value in the array if only one is supplied" do

    end
    it "#heapq_smaller_child(): returns the index of the smaller child value" do

    end
    it "#heapq_larger_child(): returns nil if at least one index is out of range" do

    end
    it "#heapq_larger_child(): returns the only value in the array if only one is supplied" do

    end
    it "#heapq_larger_child(): returns the index of the larger child value" do

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
