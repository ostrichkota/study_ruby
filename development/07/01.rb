module PriceWithTax
  def price_with_tax
      # (@price * 1.1).floor(2)
      @price * 1.1
  end
end

class Taiyaki
  include PriceWithTax

  def initialize(price)
    @price = price
  end
end

taiyaki = Taiyaki.new(1000)
p taiyaki.price_with_tax