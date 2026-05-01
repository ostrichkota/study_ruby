def describe_person(name, age)
  p "#{name} is #{age} years old."
end


describe_person("Alice", 30)
describe_person(30, "Alice")


def describe_person2(name:, age:)
  p "#{name} is #{age} years old."
end


describe_person2(name: "Alice", age: 30)
describe_person2(age: 30, name: "Alice")