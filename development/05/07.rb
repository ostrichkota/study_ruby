def describe_person(name:, age: 25)
  p "#{name} is #{age} years old."
end

describe_person(name: "Alice")
describe_person(age: 55, name: "Bob")