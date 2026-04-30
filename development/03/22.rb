numbers = [1, 2, 3, 4, 5]
string_numbers = numbers.map(&:to_s)

p string_numbers

string_numbers_2 = numbers.map do |n|
  n.to_s
end

p string_numbers_2