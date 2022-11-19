module Enumerable
  def my_each_with_index
    for i in 0...self.length
      yield self[i], i 
    end
    self
  end

  def my_select
    # Note to self: Think about what the block evaluates to. Boolean? Integer?
    result = []
    self.my_each do |item| # item is a number
      result << item if yield(item) # block arg: {|x| x > 5} => true / false. Easy!
    end
  result
  end

  def my_all?
    same = true
    self.my_each do |item|
      unless yield(item)
        same = false
        break
      end
    end
    same
  end

  def my_any?
    check = false
    self.my_each do |item|
      if yield(item) then check = true
      break
      end
    end
    check
  end

  def my_none?
    check = true
    self.my_each do |item|
      if yield(item) then check = false
      break
      end
    end
    check
  end

  def my_count
    block_size = self.length
    unless block_given?
      return block_size
    else 
      count = 0
      self.my_each do |item|
        if yield(item)
          count += 1
        end
      end
      return count
    end
  end

  def my_map
    arr = []
    self.my_each do |item|
      arr << yield(item)
    end
    arr
  end

  def my_inject(total = 0)
    self.my_each do |item|
      total = yield(total, item)
    end
    total
  end
end

class Array
  def my_each
    self.length.times do |i|
      yield self[i]
    end
    self
  end
end
