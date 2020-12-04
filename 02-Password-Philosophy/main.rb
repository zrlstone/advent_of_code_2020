require 'csv'

filepath = 'passwords.csv'

password_array = []

CSV.foreach(filepath) do |row|
  password_array << row[0].split(" ")
end

def challenge_one(password_array)
  count = 0

  password_array.each do |rule|
    letter_count = rule[2].count(rule[1][0])
    limits = rule[0].split("-")
    lower_limit = limits[0].to_i
    upper_limit = limits[1].to_i
    count += 1 if letter_count >= lower_limit && letter_count <= upper_limit
  end
  count
end

def challenge_two(password_array)
  count = 0

  password_array.each do |rule|
    limits = rule[0].split("-")
    lower_limit = limits[0].to_i
    upper_limit = limits[1].to_i
    count += 1 if rule[1][0] == rule[2][lower_limit] || rule[1][0] == rule[2][upper_limit]
  end
  count
end
