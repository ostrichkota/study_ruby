class Taiyaki
  def initialize(content)
    @content = content
  end
end

anko = Taiyaki.new("あんこ")
cream = Taiyaki.new("クリーム")

p anko
p cream