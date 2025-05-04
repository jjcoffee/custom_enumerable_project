module Enumerable
  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
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
