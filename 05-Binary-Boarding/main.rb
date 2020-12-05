file = File.read('input.txt')
codes = file.split(/\n/)

def seat_finder(string)
  row_array = (0..127).to_a
  column_array = (0..7).to_a
  row_code = string.split('').slice(0..6)
  column_code = string.split('').slice(7..9)

  row_code.each do |l|
    if l == 'F'
      row_array = lower_half(row_array)
    elsif l == 'B'
      row_array = upper_half(row_array)
    end
  end

  column_code.each do |l|
    if l == 'R'
      column_array = upper_half(column_array)
    elsif l == 'L'
      column_array = lower_half(column_array)
    end
  end

  row_array.first * 8 + column_array.first
end

def lower_half(array)
  l = array.length
  x = (l / 2) - 1
  array.slice(0..x)
end

def upper_half(array)
  l = array.length
  x = (l / 2)
  array.slice(x..l)
end

seat_nums = codes.map { |code| seat_finder(code) }

p seat_nums.max

  my_seat = (seat_nums.min..seat_nums.max).to_a - seat_nums
p my_seat.first
