i = 0
[1, 2, 3, 4, 5].each do |num|
  p num
  i += 1
  if i < 3
    puts "iが#{i}で3未満なので繰り返しを最初からやり直します"
    redo
  end
end