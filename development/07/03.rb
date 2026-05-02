module PriceWithTax
  TAX_RATE = 1.1
end

class Taiyaki
  include PriceWithTax

  def initialize(price)
    @price = price
  end

  def price_with_tax
    # @price * PriceWithTax::TAX_RATE
    @price * TAX_RATE
  end

end

taiyaki = Taiyaki.new(1000)
p taiyaki.price_with_tax