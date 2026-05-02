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
    "具材は#{super}です"
  end
end


anko_taiyaki = AnkoTaiyaki.new("つぶあん")
p anko_taiyaki.content
p anko_taiyaki.type
