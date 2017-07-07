module Enumerable
  def my_each
    i = 0
    a = []
    while i < self.length
      yield(self[i])
      a.push(self[i])
      i += 1
    end
    return a
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i],i)
      i += 1
    end
  end

  def my_select
    a = []
    self.my_each{|x| a.push(x) if yield(x)}
    return a
  end

  def my_all?
    self.my_each {|x| return false unless yield(x)}
    return true
  end

  def my_any?
    self.my_each {|x| return true if yield(x)}
    return false
  end

  def my_none? # this was fun
    self.my_each {|x| return false if yield(x)}
    return true
  end
  
  def my_count
    c = 0
    if block_given? #this is important
      self.my_each{|x| c += 1 if yield(x)}
    else
      c = self.length
    end
    return c
  end

  def my_map method=nil
    a = []
    unless block_given?
      self.my_each{|x| a.push(method.call(x))}
    else
      self.my_each{|x| a.push(yield(x))}
    end
    return a
  end

  def my_inject
    if block_given?
      acc = self[0]
      i = 1
      while i < self.length
        acc = yield(acc,self[i])
        i +=1
      end
      return acc
    end
  end
end

def multiply_els(arr)
  arr.my_inject{|x,y| x*y}
end

# Some sample test
#b = [1,2,3,4]
#b.each {|x| puts x}
#b.my_each {|x| puts x}
#b.each_with_index{|x,y| puts "index #{y} value #{x}"}.inspect
#b.my_each_with_index{|x,y| puts "index #{y} value #{x}"}
#puts b.select{|x| x > 2}
#puts b.my_select{|x| x > 2}
#b.all?{|x| x < 5}
#b.my_all?{|x| x < 5}
#puts b.any?{|x| x > 3}
#puts b.my_any?{|x| x > 3}
#tests for any,none,all
#puts b.all?{|x| x < 3}
#puts b.any?{|x| x < 3}
#puts b.none?{|x| x < 3}
#puts b.my_all?{|x| x < 3}
#puts b.my_any?{|x| x < 3}
#puts b.my_none?{|x| x < 3}
#puts b.count{|x| x > 3}
##puts b.my_count{|x| x > 3}
#puts b.map{|x| x*2}
#dob = Proc.new {|x| x*2}
#puts b.my_map(dob)
#puts b.my_map{|x| x*2}

#puts b.inject{|x,y| x * y}
#puts b.my_inject{|x,y| x * y}
#puts b.my_inject{|x,y| x +y}
