# what classes do you need?
 
# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)
 
# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'

class List
  attr_reader :tasks
  def initialize(filename)
    @filename = filename
    @tasks = []
    load
  end

  def add(task_text)
    @tasks << Task.new(task_text)
  end

  def display
    @tasks.each_with_index do |task, index|
      puts "#{index}. #{task}"
    end
  end

  def delete(task_id)
    @tasks.delete_at(task_id)
  end

  def complete_task(task_id)
    @tasks[task_id].completed
  end

  def save
    CSV.open("#{@filename}.csv", "w+") do |row|
      @tasks.each do |task|
        row << task
      end
    end
  end

  def load
    filetext = CSV.read("#{@filename}.csv")
    filetext.each do |array|
      @tasks << Task.new(array[0])
    end
  end
end

class Task
  attr_reader :text

  def initialize(task_text)
    @text = task_text
    @completed = false
  end

  def completed
    @completed = true
  end

  def to_s
    if @completed
      "[X] #{@text}"
    else
      "[ ] #{@text}"
    end
  end
end


class UserInput

  def initialize(filename = 'todo')
    @list = List.new(filename)
    @list.load
  end

  def run 

      if ARGV[0] == "list"
        @list.display
      elsif ARGV[0] == "add"
        @list.add(ARGV[1..-1].join(''))
        puts "Appended #{ARGV[1..-1].join(' ')} to your TODO list..."
      elsif ARGV[0] == "delete"
        task_text = @list.delete(ARGV[1].to_i)
        puts "Deleted #{task_text} to your TODO list..."
      elsif ARGV[0] == "complete"
        @list.complete_task(ARGV[1].to_i)
      end
      @list.save
    end
end


new_todo = UserInput.new

new_todo.run
