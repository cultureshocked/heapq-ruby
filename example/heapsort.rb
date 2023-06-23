require '../src/heapq_array.rb'

numbers = (0..999).to_a
arr = []
arr = numbers.sample 1000

arr.heapq_min_heapify!

sorted = []
until arr.size == 0
  sorted << arr.heapq_min_deque
end

p sorted
