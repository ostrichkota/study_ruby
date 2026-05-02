class Taiyaki
  def initialize(content)
    @content = content
  end
  
  def self.show_self
    self
  end

  def self.display_self
    "selfは#{show_self}です"
  end
  
  def show_self
    self
  end

  def display_self
    "selfは#{show_self}です"
  end
  
  def info
    "たい焼きは餡子やクリームなどを入れた焼き菓子です"
  end

end

p Taiyaki.show_self
p Taiyaki.display_self

taiyaki = Taiyaki.new("あんこ")
p taiyaki.show_self
p taiyaki.display_self

