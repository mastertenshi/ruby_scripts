def bubble_sort(arr)
  for i in 0...arr.length
    sorted = true

    for k in 0...(arr.length - i - 1)
      if arr[k] > arr[k + 1]
        arr[k], arr[k + 1] = arr[k + 1], arr[k]
        sorted = false
      end
    end

    break if sorted
  end
  arr
end

data = [10, 2, 6, 2, 1, 5, 8, 6, 0, 2, 8, 9]

p bubble_sort(data)
# => [0, 1, 2, 2, 2, 5, 6, 6, 8, 8, 9, 10]