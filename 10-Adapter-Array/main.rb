input = File.read('input.txt').split("\n").map(&:to_i)

# challenge 1

def jolt_differences(array)
  array.sort!
  b = 0

  differences = array.map do |v|
    x = v - b
    b = v
    x
  end

  differences.count(1) * (differences.count(3) + 1) # 2263
end

puts jolt_differences(input) # 2263

# challenge 2

data = [0, *input.sort, input.max + 3]

def arrangements(data)
  options = [0] * data.length

  options[0] = 1

  for i in (1...data.length) do
    for j in (1..3) do
      if i - j >= 0
        if data[i] - data[i - j] <= 3
          options[i] += options[i - j]
        end
      end
    end
  end

  options.last
end

puts arrangements(data) # 396857386627072
