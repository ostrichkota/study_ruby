puts "数値を入力してください"

num = gets.chomp.to_i

if num % 2 == 0
  puts "偶数です"
else
  puts "奇数です"
end