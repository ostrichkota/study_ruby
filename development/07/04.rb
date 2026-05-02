module Admin
  class Taiyaki
    def initialize(price)
      @price =price 
    end

    def price
      @price * 0.8
    end
  end
end

admin_tiyaki = Admin::Taiyaki.new(100)
p admin_tiyaki.price

module Special
  class Taiyaki
    def initialize(price)
      @price =price 
    end

    def price
      @price * 0.9
    end
  end
end

special_tiyaki = Special::Taiyaki.new(100)
p special_tiyaki.price

class Taiyaki
  def initialize(price)
    @price =price 
  end

  def price
    @price
  end
end


tiyaki = Taiyaki.new(100)
p tiyaki.price