class Taiyaki
  @@count = 0

  def initialize(content)
    @content = content
    @@count += 1
  end

  def self.count
    @@count
  end
end

taiyaki = Taiyaki.new("あんこ")
p Taiyaki.count
taiyaki2 = Taiyaki.new("いちご")
p Taiyaki.count
taiyaki3 = Taiyaki.new("チョコ")
p Taiyaki.count
# taiyaki.adjust
# taiyaki.control