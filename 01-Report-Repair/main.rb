require 'csv'

filepath = '1664.csv'

payroll_array = []

CSV.foreach(filepath) do |row|
  # Here, row is an array of columns
  payroll_array << row[0].to_i
end

p payroll_array

def sum_pairs(ints, s)
  (1...ints.size).each do |x|
    (0...x).each do |y|
      (0...y).each do |z|
        return [ints[y], ints[x], ints[z]] if ints[x] + ints[y] + ints[z] == s
      end
    end
  end
end

value = sum_pairs(payroll_array, 2020)

value.inject(:*)
