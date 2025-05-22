module Enumerable
  # Your code goes here
  
  def my_each_with_index
    i = -1
    self.my_each do |value, index|
     i += 1
      index = i 
     yield(value, index)
    end
  end

  def my_select
    selected_values = []
    self.my_each do |value|
      if yield(value) == true
        selected_values.push(value)
      end
    end
    p selected_values
  end

  def my_all?
    new_array = []
    self.my_each do |value|
      if yield(value) == true
        new_array.push(value)
      end
    end
      if new_array == self
        return true
      elsif new_array != self
        return false
      end
  end

  def my_any?
    new_array = []
    self.my_each do |value|
      if yield(value) == true
        new_array.push(value)
      end
    end
    if new_array != []
      return true
    elsif new_array == []
      return false
    end
  end

  def my_none?
    new_array = []
    self.my_each do |value|
      if yield(value) == true
        new_array.push(value)
      end
    end
    if new_array != []
      return false
    elsif new_array == []
      return true
    end
  end

  def my_count
    if block_given? == false
      return self.size
    elsif block_given? == true
      count = 0
      self.my_each do |value|
        if yield(value) == true
          count += 1
        end
      end
    end
    return count
  end

  def my_map
    new_array = []
    self.my_each do |value|
      new_array.push(yield(value))
    end
    return new_array
  end

  def my_inject(initial_value)
    i = -1
    current_iteration = 0
    self.my_each do |value, value2|
      if i == -1
        value = initial_value
      else
        value = current_iteration
      end
      value2 = self[i + 1]
      current_iteration = yield(value, value2)
      i += 1
    end
    return current_iteration
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.each do |elem|
      yield(elem)
    end
  end
end
