arr = [4,3,78,2,0,2]

def bubble_sort(arr)
  l = arr.length
  i = 0
  while l >1
    while i < l-1
      arr[i],arr[i+1] = arr[i+1],arr[i] if arr[i]>arr[i+1]
      i +=1
    end
    i = 0
    l -= 1
  end
  puts arr.inspect()
end

def bubble_sort_by(arr)
  l = arr.length
  i = 0
  while l >1
    while i < l-1
      arr[i],arr[i+1] = arr[i+1],arr[i] if yield(arr[i],arr[i+1]) == -1
      i +=1
    end
    i = 0
    l -= 1
  end
  puts arr.inspect()
end

bubble_sort_by(arr) do |a,b|
  if a < b
    1
  elsif a > b
    -1
  else
    0
  end
end


bubble_sort(arr)
