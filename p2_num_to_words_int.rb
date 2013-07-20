def to_words(number_to_convert)
  words = {     1000   => " thousand",
                 100   => " hundred",
                  90   => " ninty",
                  80   => " eighty",
                  70   => " seventy",
                  60   => " sixty",
                  50   => " fifty",
                  40   => " forty",
                  30   => " thirty",
                  20   => " twenty", 
                  19   => " nineteen",
                  18   => " eighteen",
                  17   => " seventeen",
                  16   => " sixteen",
                  15   => " fifteen",
                  14   => " fourteen",
                  13   => " thirteen",
                  12   => " twelve",
                  11   => " eleven",
                  10   => " ten",
                   9   => " nine",
                   8   => " eight",
                   7   => " seven",
                   6   => " six",
                   5   => " five",
                   4   => " four",
                   3   => " three",
                   2   => " two",
                   1   => " one" }
  
  words_to_show = ""
  words.each do |number, number_word|
    if number_to_convert >= number && number_to_convert > 100
        div = number_to_convert/number
        words.each do |number1, number_word1|
            if div >= number1 && div > 100
              words_to_show  <<  number_word1
              div %= number1
            elsif div >= number1 && div < 100
              words_to_show <<  number_word1
              div %= number1
            end
        end
        words_to_show <<  number_word
        number_to_convert %= number
    elsif number_to_convert >= number && number_to_convert < 100
        words_to_show <<  number_word
        number_to_convert %= number
    end
  end
  words_to_show
end



p to_words(9)
p to_words(99)
p to_words(999)
p to_words(9999)
p to_words(99999)
p to_words(999999)

# Solution for Challenge: P1: Numbers in Words. Started 2013-06-16T17:23:39+00:00
