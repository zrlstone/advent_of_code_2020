require 'pry-byebug'
input = File.read('input.txt').split("\n")

# challenge 1

def infinite_loop(input)
  acc = 0
  i = 0
  indexes_used = []
  solution = false

  # 1. break the loop if indexes used.uniq is equal to indexes used
  while indexes_used.length == indexes_used.uniq.length

    # 2. go through the first instruction, saving the index to an array
    instruction, number = input[i].split(' ')
    number = number.to_i

    # 3. increment the index based on the instruction
    # 4. save the acc result
    if instruction == 'nop'
      i += 1
    elsif instruction == 'acc'
      i += 1
      acc += number
    elsif instruction == 'jmp'
      i += number
    end
    indexes_used << i

    # 5. record if the change in rule allowed the program to run to completion
    if i > input.length - 1
      solution = true
      return [acc, solution]
    end
  end

  [acc, solution]
end

infinite_loop(input) # 1528

# challenge 2

def transform_array(array, ind)
  array.map.with_index(0) do |v, i|
    if i == ind && v.split(' ')[0] == 'nop'
      v.gsub('nop', 'jmp')
    elsif i == ind && v.split(' ')[0] == 'jmp'
      v.gsub('jmp', 'nop')
    else
      v
    end
  end
end

def solution(input_array)
  found = false
  ind = 0
  acc = 0
  until found
    answer = infinite_loop(transform_array(input_array, ind))
    return answer if answer[1] == true

    acc = acc[0]
    found = answer[1]
    ind += 1
  end
end

p solution(input) # 640

