(1..10).each do |i|
  p i
end


(1..10).each do |i|
  next if i % 3 == 0
  p i
end