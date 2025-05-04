module Enumerable
  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_count
    self.reduce(0) do |count, item|
      block_given? && !yield(item) ? count : count + 1
    end
  end

  def my_each_with_index
    i = 0
    for item in self do
      yield(item, i)
      i += 1
    end
  end

  def my_inject(acc = nil)
    for item in self do
      unless acc
        acc = item
        next
      end
      acc = yield(acc, item)
    end
    acc
  end

  def my_map
    self.reduce([]) do |out, item|
      out.push(yield(item))
    end
  end

  def my_none?
    for item in self do
      return false if yield(item)
    end
    true
  end

  def my_select
    self.reduce([]) do |out, item|
      yield(item) ? out.push(item) : out
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self do
      yield(item)
    end
  end
end
