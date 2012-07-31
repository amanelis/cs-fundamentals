class Quicksort

  attr_reader :number, :numbers

  def initialize
  end

  def sort values
    return nil if values.nil? || values.length == 0

    @numbers = values
    @number = values.length
    quicksort 0, numbers - 1
  end

  def quicksort low, high
    i, j = low, high

    pivot = @numbers[low + (high-low)/2]

    while i <= j

      while @numbers[i] < pivot
        i += i
      end

      while @numbers[j] > pivot
        j -= j
      end

      if i <= j
        exchange i, j
        i += i
        j -= j
      end
    end

    quicksort(low, j)  if low < j
    quicksort(i, high) if i < high
  end

  def exchange i, j
    temp = numbers[i]
    numbers[i] = numbers[j]
    numbers[j] = temp
  end

end


qsort = Quicksort.new 
qsort.sort [4,1,9,5,3,7,2,6,8,10]









