file = File.read('input.txt')
passports = file.split(/\n\n/)

# challenge 1

def required_fields?(array)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid cid]
  remainder = required_fields - array
  remainder.empty? || remainder[0] == "cid"
end

valid = passports.select do |n|
  id_array = n.scan(/(.{3}):/).flatten
  required_fields?(id_array)
end

puts valid.length



# challenge 2
