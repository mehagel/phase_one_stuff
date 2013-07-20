class Student
  attr_accessor :name, :scores

  def initialize(name, scores) 
  	@name = name
  	@scores = scores
  end

  def average
  	p @scores.inject {|sum, score| sum += score }/@scores.length
  end

  def letter_grade
  	if 		average >= 90
  		'A'
  	elsif average >= 80
  		'B'
  	elsif average >= 70
  		'C'
  	elsif average >= 60
  		'D'
  	else								
  		'F'
  	end
  end
end

 def linear_search(students, student_name)
  	students.each_with_index do |student, index|
  		if (student.name == student_name)		
  			 		return index
  		else
  					return -1
  		end
  	end
  end

#===========DRIVER CODE : DO NOT MODIFY =======

#Make sure these tests pass
# Tests for part 1:

students =[]
students << Student.new("Alex Golding", [100,100,100,0,100])
students << Student.new("Bille Bob",[67,76,78,89,87])
students << Student.new("James Dean", [88,84,83,82,81])
students << Student.new("Holly Stephens", [99,92,76,82,78])
students << Student.new("Joe Spalding", [55,65,66,77,67])

p students[0].name == "Alex Golding"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0

# Tests for part 2
p students[1]
p students[2]
p students[0].average == 80
p students[3].letter_grade == 'B'

# Tests for part 3
p linear_search(students,'Alex Golding') == 0
p linear_search(students, "NOT A STUDENT") == -1
