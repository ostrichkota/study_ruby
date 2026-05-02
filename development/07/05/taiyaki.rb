require_relative "./price_with_tax" 

class Taiyaki
  include PriceWithTax

  def initialize(price)
    @price = price
  end

end

taiyaki = Taiyaki.new(1000)
p taiyaki.price_with_tax