def substrings(string, dict)
  hash = {}

  dict.each do |key|
    string.split(" ").each do |word|
      if word.downcase.include?(key)
        hash.key?(key) ? hash[key] += 1 : hash[key] = 1
      end
    end
  end
  
  hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

puts substrings(string, dictionary)

# output: {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, 
# 	"it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}