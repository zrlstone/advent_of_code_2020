require_relative 'passport'

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

p valid.length # 222

# challenge 2

passport_array = []

valid.each do |passport|
  passport_hash = {}
  passport.scan(/(.{3}):(.\w+)/).each do |pair|
    passport_hash[pair[0].to_sym] = pair[1]
  end
  passport_array << passport_hash
end

passed = passport_array.select do |h|
  passport = Passport.new(h)
  required_fields = %w[byr iyr eyr hgt hcl ecl pid]
  tests = []
  required_fields.each do |field|
    tests << passport.send("#{field}_check")
  end
  tests.all?
end

puts passed.length # 140
