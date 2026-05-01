def review_average(total, count)
  return "まだレビューがありません" if count == 0 
  total / count
end

p review_average(1867.5, 400)
p review_average(1867.5, 0)