def with_block(&block)
  p "Before block"
  yield
  p "After block"
end

with_block{p "Inside block" }


def with_block2()
  p "Before block"
  yield if block_given?
  p "After block"
end

with_block2{p "Inside block" }
with_block2