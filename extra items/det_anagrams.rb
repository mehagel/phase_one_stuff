def is_anagram?(word1, word2)
  
  word1_array = word1.split(//).sort
  word2_array = word2.split(//).sort
  word1_array == word2_array

end
p is_anagram?('cinema', 'iceman') # => true
# p is_anagram?('iceman', 'cinema') # => true
