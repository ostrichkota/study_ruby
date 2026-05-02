class Taiyaki
  CONTENTS = ["あんこ", "クリーム", "チーズ"]

  # def bad_constants
  #   BAD = "BAD"
  # end
  
  def initialize(content)
    @content = content
  end

  def display_contents
    "たい焼きの具は#{CONTENTS}で、取り扱っています"
  end

  def self.contents
    CONTENTS
  end
end

taiyaki = Taiyaki.new("あんこ")
p taiyaki.display_contents
p Taiyaki.contents
p Taiyaki::CONTENTS
# taiyaki.adjust
# taiyaki.control