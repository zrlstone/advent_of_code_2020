input = File.read('input.txt').lines
    .map do |l|
        m = l.match(/(.*) bags contain (.*)/)
        {   m[1] => m[2].split(',')
            .map { |b| (m2 = b.match(/(\d+) (.*) bag.*/)) ? { m2[2] => m2[1].to_i } : {} }
            .reduce(Hash.new, :merge)
        }
    end.reduce(Hash.new, :merge)

p input
