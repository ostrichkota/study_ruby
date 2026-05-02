module PriceWithTax
  def tax
      1.1
  end
end

class Product
  extend PriceWithTax
end

p Product.tax