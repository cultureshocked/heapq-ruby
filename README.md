# heapq-ruby

The Ruby standard library is missing a proper built-in implementation of the `heapq` or Priority Queue algorithm.

This repository is for my personal implementation for this algorithm for use in my own projects.

## Installing

Just download the `heapq.rb` file and `require` it wherever you would like to use it. No additional dependencies.

## Testing

```bash
gem install rspec
git clone https://github.com/cultureshocked/heapq-ruby
cd heapq-ruby
rspec

```

See `spec/heapq_spec.rb` for the unit tests.

## Using this library with custom types

The only requirements to use this library are:
1. Using an `Array` for the `arr` arguments for functions.
2. Using an `Integer` for `idx`
3. The elments of the `Array` must implement the `Comparable` class.

The third point, although being a requirement, is not enforced in this code, as checking the entire `arr` happens in linear time, and the point of using a priority queue is to make it faster.

If you want to use this heapq implementation for custom classes, as long as you can adequately compare them with regular logical operators (eg., `==`, `<`, `>`) then this implementation will work perfectly fine.

You may need to do some refactoring/wrapping on your part to make that happen.

## License

GPLv3. See the `LICENSE` file.
