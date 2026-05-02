class Taiyaki
  def initialize(content)
    @content = content
  end

  def content
  @content
  end
end

anko = Taiyaki.new("あんこ")
cream = Taiyaki.new("クリーム")

p anko.content
p cream.content