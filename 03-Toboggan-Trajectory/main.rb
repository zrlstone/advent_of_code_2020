require 'csv'

filepath = 'toboggan.csv'

path_array = []

CSV.foreach(filepath) do |row|
  path_array << row[0].split('')
end

def trees(array, right, down)
  right_value = 0

  trees_array = []

  array.each_with_index do |v, i|
    next if i < down || i % down > 0

    right_value += right
    right_value -= v.length if right_value >= v.length
    trees_array << v[right_value]
  end

  trees_array.select { |tree| tree == "#" }.length
end

puts trees(path_array, 3, 1) * trees(path_array, 1, 1) * trees(path_array, 5, 1) * trees(path_array, 7, 1) * trees(path_array, 1, 2)
