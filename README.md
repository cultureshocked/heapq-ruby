# heapq-ruby

The Ruby standard library is missing a proper built-in implementation of the `heapq` or Priority Queue algorithm.

This repository is for my personal implementation for this algorithm for use in my own projects.

## Installing

Just download the `heapq.rb` file or `heapq_array.rb` file and `require` it wherever you need it.

For `heapq.rb` you will need to `include PriorityQueue` before using any of the methods as well.

This will change in a future version.

This implementation works on Ruby 3.2. I cannot confirm functionality with other versions, but there's a good chance they'll work anyway.

## Usage

The easiest way to use this implementation is with the `heapq_array.rb` file.

All the `heapq_` methods will attach to the `Array` class so you can use them on existing arrays.

There are five main actions that heapq can perform:
```ruby
# Enqueue:
arr.heapq_min_enqueue(val)
arr.heapq_max_enqueue(val)
# Deque:
arr.heapq_min_deque
arr.heapq_max_deque
# Update:
arr.heapq_min_update(old_val, new_val)
arr.heapq_max_update(old_val, new_val)
# Heapify/Build-heap
arr.heapq_min_heapify
arr.heapq_min_heapify!
arr.heapq_max_heapify
arr.heaps_max_heapify!
# Peek
arr.heapq_peek
```
Methods with `_min_` in them are for use with minheaps, while `_max_` methods should be used for maxheaps.
The `peek` method can be used on either.

**BEFORE YOU BEGIN USING HEAPQ METHOD ON ANY ARRAY** you should **convert the source array to a heap** with the `_heapify!` method or **generate a new array to use as a heap** with the `_heapify` method (note the safe/unsafe versioning)

**YOU SHOULD NOT DIRECTLY ACCESS THE ARRAY IF YOU PLAN ON USING HEAP OPERATIONS LATER!**

These things are not enforced, because there are times when you might be done with the heap and only want to retrieve the data from it. As a result, there's no locking mechanism to prevent you from directly accessing the array. Just be warned that heap methods might not work correctly afterwards, at least until you generate a new heap from the array (or re-heapify it in-place.)

*****

If you do not want to extend the built-in `Array` class, then you can use the `heapq.rb` source file.

```ruby
require_relative './heapq.rb'
include PriorityQueue

arr = []
peek(arr)
enqueue(arr, val)
dequeued = deque(arr)
update(arr, old_val, new_val)
```

A proper heapify method will also be included at a later date, as well as easier importing into your code.

## Testing

```bash
gem install rspec
git clone https://github.com/cultureshocked/heapq-ruby
cd heapq-ruby
rspec

```

Uncomment the `private` access specifier in `src/heapq_array.rb` to ensure that the tests for the private methods don't fail.

See `spec/heapq_spec.rb` and `heapq_array_spec.rb` for the unit tests.

## Using this library with custom types

The only requirements to use this library are:
1. Using an `Array` for the `arr` arguments for functions.
2. Using an `Integer` for `idx`
3. The elements of the `Array` must implement the `Comparable` class.

The third point, although being a requirement, is not enforced in this code, as checking the entire `arr` happens in linear time, and the point of using a priority queue is to make it faster.

If you want to use this heapq implementation for custom classes, as long as you can adequately compare them with regular logical operators (eg., `==`, `<`, `>`) then this implementation will work perfectly fine.

You may need to do some refactoring/wrapping on your part to make that happen.

## License

GPLv3. See the `LICENSE` file.
