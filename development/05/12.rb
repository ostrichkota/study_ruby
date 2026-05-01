def build_profile(name, age, location = "Unknown")
  p "Name: #{name}, Age: #{age}, Location: #{location}"
end

build_profile("Alice", 30, "Tokyo")
build_profile("Bob", 55)
# build_profile("Charry")