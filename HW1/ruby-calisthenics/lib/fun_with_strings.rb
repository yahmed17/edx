module FunWithStrings
  def palindrome?
    p = self.gsub(/\W/,"")
    p.reverse.casecmp(p)==0
  end
  def count_words
    cw = self.downcase.split
    hash = Hash.new()
    cw.each do |w|
      s = w.gsub(/\W/,"")
      if !s.empty? then
      cnt =hash.fetch(s) { |x| hash[x]=1; 0 }
      puts s + " " + "%d",cnt
      if (cnt>0) then
        hash[s] = cnt+1
      end
        end
    end
    return hash
  end
  def anagram_groups
     return [] if self.empty?
    hash = Hash.new()
    self.downcase.split.each do |w|
      sortedWord = w.chars.sort.join
      arr = hash.fetch(sortedWord) { |s| hash[sortedWord]=[w]; 0}
      if (arr!=0)
        hash[sortedWord] = arr << w
      end
    end
    hash.values

  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
