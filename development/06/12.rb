class Taiyaki

  def bake
    p adjust
    p control
  end

  private

  def adjust
    "生地の厚さを調整する"
  end

  def control
    "温度を調整する"
  end
end

taiyaki = Taiyaki.new
taiyaki.bake
# taiyaki.adjust
# taiyaki.control