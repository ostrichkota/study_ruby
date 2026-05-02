class Taiyaki
  def initialize(content)
    @content = content
  end

  attr_reader :content
end

anko = Taiyaki.new("あんこ")
cream = Taiyaki.new("クリーム")
p anko.content
p cream.content
