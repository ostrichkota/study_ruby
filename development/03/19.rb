names = ["Alice", "Bob", "ALICE", "bob"]
p names

unique_names = names.uniq { |name| name.downcase }
p unique_names

unique_names_2 = names.uniq do |name|
  name.downcase
end
p unique_names_2