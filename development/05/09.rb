def good_numbers(*numbers)
  p numbers
  p "今日のラッキーナンバーは#{numbers.join(", ")}です"
end

good_numbers(1)
good_numbers(100, 500, 300)