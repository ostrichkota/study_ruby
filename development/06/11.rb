class Taiyaki
  def initialize(content)
    @content = content
  end

  attr_accessor :content
  
  def change_content=(val)
    self.content = val
  end

  def bad_change_content=(val)
    content = val
  end

end

taiyaki = Taiyaki.new("あんこ")
p taiyaki.content
taiyaki.change_content = "クリーム"
p taiyaki.content
taiyaki.change_content = "チーズ"
p taiyaki.content

