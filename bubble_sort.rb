def bubble_sort(arr)
  arr.each_index do |i|
    limit = arr.length - i - 1
    sorted = true

    arr.each_index do |k|
      break unless k < limit

      if arr[k] > arr[k + 1]
        swap(arr, k, k + 1)
        sorted = false
      end
    end

    if sorted
      break
    end
  end

  arr
end

def swap(arr, i, k)
  arr[i], arr[k] = arr[k], arr[i]
end

data = [2, 6, 2, 1, 5, 8, 6, 0, 2, 8, 9]

p bubble_sort(data)
# => [0, 1, 2, 2, 2, 5, 6, 6, 8, 8, 9]