class Taiyaki
  def initialize(content)
    @content = content
  end
  
  def content
    @content
  end

end

class AnkoTaiyaki < Taiyaki
  def type
    "あんこ"
  end

  def content
    "具材は#{@content}です"
  end

end

class CreamTiyaki < Taiyaki
  def type
    "クリーム"
  end
end


anko_taiyaki = AnkoTaiyaki.new("つぶあん")
p anko_taiyaki.content
p anko_taiyaki.type

cream_taiyaki = CreamTiyaki.new("チョコ")
p cream_taiyaki.content
p cream_taiyaki.type