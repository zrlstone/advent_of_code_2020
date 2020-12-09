input = File.read('input.txt').split("\n").map(&:to_i)

# challenge 1

def preamble_decrypter(input_array)
  # accetps array and returns first value that does not meet the preamble rules
  preamble = []

  input_array.each_with_index do |v, i|
    preamble << v
    # "preamble #{preamble}"
    next if i < 25

    preamble_check = preamble[0..24]
    # "preamble_check #{preamble_check}"
    return v if preamble_check.combination(2).any? { |a, b| (a + b) == v } == false

    preamble.shift if preamble.length == 26
  end
end

num = preamble_decrypter(input) # 257342611

# subset sum

i = 0
x = 0

while i < input.length do
  if input[i..x].sum == num
    break if x > i # at least two numbers
  elsif input[i..x].sum < num
    x += 1
  else
    i += 1
  end
end

# add .first and .last of the array
puts input[i..x].minmax.sum # 356020



