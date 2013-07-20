class Student
  attr_accessor :scores, :name

  def initialize(name, scores) 
      @scores   = scores
      @name     = name
  end

  def average
    @scores.inject {|sum , x| sum + x}/@scores.length
  end 

  def letter_grade
      if    average   >= 90
            "A"
      elsif average   >= 80
            "B"
      elsif average   >= 70
            "C"
      elsif average   >= 60
            "D"
      else average    <= 59
            "F"
      end
  end

  def scores
    @scores
  end

  def name
    @name
  end
end

def linear_search(students, student_name)
  students.each_with_index do |student, index|
    if(student.name == student_name)
      return index
    else
      return -1
    end
  end
  
end


students = []
students << Student.new("Alex",[100,100,100,1,100]  )
students << Student.new("Bob", [100,90,100,0,100]   )
students << Student.new("Mark",[100,100,80,0,100]   )
students << Student.new("Joe", [100,100,100,70,100] )
students << Student.new("Jim", [100,100,100,0,60]   )


 
p students[0].name == "Alex"
p students[0].scores.length ==5
p students[0].scores[0]==students[0].scores[4]
p students[0].scores[3]==0
p students[4]

# Tests for part 2
 
p students[0].average == 80
p students[0].letter_grade == 'B'
 
# # Tests for part 3
 
p linear_search(students,"Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1
