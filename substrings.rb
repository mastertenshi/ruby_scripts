def substrings(string, dict)
  hash = {}

  dict.each do |key|
    key.downcase!

    string.split(" ").each do |word|
      word.downcase!

      if word.include?(key)
        if hash.key?(key)
          hash[key] += 1
        else
          hash[key] = 1
        end
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