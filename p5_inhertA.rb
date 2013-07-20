module Functions
   def drive
      @status = :driving
   end

   def needs_gas?
      return [true,true,false].sample
   end

end

class Vehicle
   include Functions

   @@WHEELS = 4
   def initialize(args)
      @color = args[:color]
   end

   def brake
      if drive == "driving"
      return "moving"
      else
         return "stopped"
      end  
   end

   def lights_on?
      return [true,false].sample
   end
end

class Car < Vehicle
  @@WHEELS = 4
  def initialize(args)
     super
     @wheels = @@WHEELS
  end
end

class Bus < Vehicle
  attr_reader :passengers

  def initialize(args)
   super
   @wheels = args[:wheels]
   @num_seats = args[:num_seats]
   @fare = args[:fare]
   @passengers=[]
   end

   def drive
      return self.brake if stop_requested?
      @status = :driving
   end
   def admit_passenger(passenger,money)
      @passengers << passenger if money > @fare
   end 
   def stop_requested?
      return [true,false].sample
   end
end

class Motorbike < Vehicle
  @@WHEELS = 2
   def initialize(args)
   super
   @wheels = @@WHEELS
   end

   def weave_through_traffic
   @status = :driving_like_a_crazy_person
   end

   def gear_in?
      if brake == 'moving'
      return ['1st', '2nd', '3rd', '4th', '5th'].sample
      else
         return 'neutral'
      end
   end

end

porsche=Car.new({:color => "red"})
puts "My Porsche is currently #{porsche.drive}"
puts "Does my Porsche need gas?#{porsche.needs_gas?}"
puts "Are my Porsche lights on? #{porsche.lights_on?}"
puts

greyhound=Bus.new({:color => "grey", :wheels => 10, :num_seats => 24, :fare => 2})

puts "The Greyhound bus I'm on is #{greyhound.drive}"
puts "The Greyhound bus I'm on needs gas? #{greyhound.needs_gas?}"
puts "We are picking up a passenger named #{greyhound.admit_passenger("Joe", 3)}"
puts "The Greyhound bus I'm on has it lights on?  #{greyhound.lights_on?}"
puts


hog=Motorbike.new({:color => "green"})

puts "My Motorcycle is currently #{hog.drive}"
puts "Does my Motorcycle need gas?#{hog.needs_gas?}"
puts "Are my Motorcycle lights on? #{hog.lights_on?}"
puts "I'm driving my Motorcycle #{hog.weave_through_traffic}"
