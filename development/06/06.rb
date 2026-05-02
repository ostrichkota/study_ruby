class Taiyaki
  def initialize(content)
    @content = content
  end

  attr_reader :content
  attr_writer :content
end

anko = Taiyaki.new("あんこ")
cream = Taiyaki.new("クリーム")
anko.content = "チョコ"
p anko.content
p cream.content
