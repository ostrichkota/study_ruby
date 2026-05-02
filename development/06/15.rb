class Taiyaki
  def initialize(content)
    @content = content
  end

  attr_accessor :content
end

anko = Taiyaki.new("あんこ")
p anko.content

class Taiyaki
  def initialize(content, price)
    @content = content
    @price = price
  end

  attr_accessor :price
end

cream = Taiyaki.new("クリーム", 300)
p cream.content
p cream.price