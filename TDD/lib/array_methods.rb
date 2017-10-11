class Array
  def my_uniq
    uniq_values = []
    self.each do |e|
      uniq_values << e unless uniq_values.include?(e)
    end
    uniq_values
  end

  def two_sum
    ans_arr = []
    self.each_index do |i|
      (i + 1).upto(self.length - 1) do |j|
        ans_arr << [i, j] if self[i] + self[j] == 0
      end
    end
    ans_arr
  end

end

def my_transpose(arr)
  transposed_arr = Array.new(arr.length) { Array.new(arr.length) }

  arr.length.times do |i|
    arr.length.times do |j|
      transposed_arr[i][j] = arr[j][i]
    end
  end

  transposed_arr
end

def stock_picker(arr)
  max = 0
  max_index = []
  arr.each_index do |i|
    (i + 1).upto(arr.length - 1) do |j|
      if (arr[j] - arr[i] > max)
        max_index = [i, j]
        max = arr[j] - arr[i]
      end
    end
  end
  max_index
end
