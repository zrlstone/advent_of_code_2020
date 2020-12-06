file = File.read('input.txt')
codes = file.split(/\n\n/).map { |i| i.tr("\n", '') }

# challenge 1
p codes.map { |s| s.split('').uniq.length }.inject(0, :+) # 6291

# challenge 2

answers = file.split(/\n\n/).map{ |i| i.strip.split.uniq }

points = 0
answers.each do |i|
  if i.length == 1
    points += i[0].length
  else
    a = i.map { |string| string.split('') }.flatten
    b = Hash.new(0)
    a.each { |v| b[v] += 1 }
    b.each { |_, v| points += 1 if v == i.length }
  end
end

p points # 3052
