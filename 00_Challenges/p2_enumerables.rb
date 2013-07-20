
# Array#map  Map takes elements from an array and then return a new array 
# containing the items from the original array and , in this case, and adds the
#item from the block
class Array
  def my_map     
    mapped_array = Array.new
    self.length.times do |item|
       mapped_array << yield(self[item])
    end
    puts mapped_array
  end
  [22,11,3,4].my_map { |i| i -= 1 }


# # #Array#inject Inject takes all the elements of an array and runs them through some
# # #binary operation (ex +,-,?*) via a block and then returns the value.


# #Array#select Finds all element in a given array that are return true for a given block


#Array#min Takes an array and finds the min element in an array.
# def array_first

  def my_min
    golf_array = []
    self.each do |scores|
      golf_array << yield(self) if yield(self)
    end
  puts golf_array
  end
[75,76,78,77,79,74,72].my_min {|x| x.min }
end


#   def my_map   
#     results = []          # or other enumerable method
#     self.length.times do |x|
#       results << yield(self[x])
#     end
#     return results
#   end
# end

# puts [1,2,3,4].my_map { |i| i -= 1 }  == [0,1,2,3]   # makes you count like a programmer!
# add your own test here
