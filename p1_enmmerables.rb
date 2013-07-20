# Array#map, 
# Array#map is used to act upon the individual elements in an array and return a new
#  array. Each elements is acted upon by a block, (which are chuncks of code between either
# braces or between do - end), once as defined within the method. 


# Array#inject, 
# Array#inject is used to act upon individual elements in an array and returns a new
# array, The elements are passed to a block of code (which are chuncks of code between either braces or between do - end)that performs mathmatical equations 
# on the elements in the array.

# Array#select, 
# Array#select is used to act upon individual elements in an array and returns a new
# array. The method returns all elements from the array for which it returns a true
# value after it has been evelauated by the block.


# Array#drop 
 #Array#drop is used to act upon individual elements in an array and it drops elemets in the array for which the block returns a nil vaule. 



class Array
  def my_map   
    mapped_array=[]        # or other enumerable method
      self.length.times do |i|
      mapped_array << yield(self[i])
    end
    mapped_array
  end

   def my_drop_while  
    drop_array=[]
      self.length.times do |i|
        if  yield(self[i]) == true
          drop_array << self[i]
        end
    end
    drop_array
  end

end

puts [1,2,3,4,5,6,7,8].my_drop_while {|i| i > 3 } == [4,5,6,7,8]  

puts [1,2,3,4].my_map {|i| i -= 1 } == [0,1,2,3]  

