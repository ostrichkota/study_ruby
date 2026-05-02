class Taiyaki
  class << self
  
    def info
      "たい焼きは餡子やクリームなどを入れた焼き菓子です"
    end
  
    def contents
        ["あんこ", "チーズ", "クリーム"]
    end
  end

end

p Taiyaki.info
p Taiyaki.contents

