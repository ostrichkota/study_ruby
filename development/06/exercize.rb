class Animal
  def initialize(name)
    @name = name
  end
  
  def speak
    "My name is #{@name}"
  end
end

class Dog < Animal
  def speak
    "#{super}" + "Woof!!"
  end
end

dog = Dog.new("犬やあああ")
p dog.speak
