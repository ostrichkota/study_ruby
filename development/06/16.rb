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

p AnkoTaiyaki.ancestors