# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require 'csv'
class List

  def initialize
    filetext =[]
    @task = []
  end

  def load_tasks
   filetext = CSV.read("todo.csv")
    filetext.each do |array|
      @task << Task.new(array[0])
    end
    p @tast
  end

  def add_task(task)
    @task << Task.new(task)
    p @task

  end

  def delete

  end

  def complete_task

  end

  def save

  end

end

class Task

  def initialize(item)
    @item = item


  end
end

todo=List.new
task=Task.new('run down the block')

todo.add_task('run down the block')
todo.load_tasks
todo.delete
todo.complete_task
todo.save
