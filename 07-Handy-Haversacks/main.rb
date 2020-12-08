require 'pry-byebug'

bags_hash = {}
File.open('input.txt') do |fp|
  fp.each do |line|
    bag = {}
    parent_bag = line.scan(/^\w+\s\w+/).join # "muted yellow"
    inner_bags = line.chomp.scan(/\d\s\w+\s\w+\s\w+/) # ["2 shiny gold bags", "9 faded blue bags"]
    if inner_bags.empty?
      bags_hash[parent_bag] = {} # { "dotted black => {} }"
    else
      inner_bags.each do |item|
        key = item.split(/\d\s(\w+\s\w+)/)[1] # shiny gold
        value = item[0].to_i # 2
        bag[key] = value # { "shiny gold" => 2}
        bags_hash[parent_bag] = bag # { "muted yellow" => {"shuny gold" => 2, "faded blue"=>9 }}"
      end
    end
  end
end


p "--------------"
# challenge 1

bag = ["shiny gold"]
count = 0

while bag.size != count
  count = bag.size
  output = bags_hash.filter do |_, v|
    v.any? { |kk, _| bag.include? kk }
  end
  bag |= output.keys
end

puts bag.length - 1 # 208

# challenge 2





p "--------------"
# challenge 2

while bags_hash.any? { |_, v| v.is_a? Hash }
  bags_hash.each do |k, v|
    next if v.is_a? Integer
    next if v.keys.any? { |b| bags_hash[b].is_a? Hash }

    bags = 0
    v.each do |kk, vv|
      bags += bags_hash[kk] * vv + vv
    end
    bags_hash[k] = bags
  end
end
p bags_hash["shiny gold"] # 1664


