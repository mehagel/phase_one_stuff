# class Vehicle
#      attr_accessor :color, :wheels, :brake, :needs_gas?

#   def initialize
#    @color
#    @wheels
#    @brake
#    @needs_gas?
#   end

#    def brake
#      @status = :stopped    
#    end

#    def needs_gas?
#      return [true,false,false,false].sample
#    end 

# end


class Car 
 @@WHEELS = 4
 def initialize(args)
   @color = args[:color]
   @wheels = @@WHEELS
 end

 def drive
   @status = :driving
 end
 def brake
   @status = :stopped    
 end
 def needs_gas?
   return [true,true,false].sample
 end
end


class Bus 
 attr_reader :passengers
 def initialize(args)
   @color = args[:color]
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

 def brake
   @status = :stopped
 end 

 def stop_requested?
   return [true,false].sample
 end

 def needs_gas?
   return [true,true,true,false].sample
 end
end

class Motorbike 
   @@WHEELS = 2
 def initialize(args)
   @color = args[:color]
   @wheels = 2

 end

 def drive
   @status = :driving
   @speed = :fast
 end

 def brake
   @status = :stopped 
 end
 def needs_gas?
   return [true,false,false,false].sample
 end 
 
 def weave_through_traffic
   @status = :driving_like_a_crazy_person
 end
end

p my_car = Car.new({:color => "green"})
p my_car.drive
p my_car.brake
p my_car.needs_gas?
puts

p my_bus = Bus.new({:color => "purple", :wheels => "10", :num_seats => "34", :fare => 1})  
p my_bus.drive
p my_bus.admit_passenger("Pee Wee", 2)
p my_bus.admit_passenger("Carl Spackler", 2)
p my_bus.admit_passenger("Long Duck Dong", 3)
p my_bus.stop_requested?
p my_bus.brake
p my_bus.needs_gas?
puts

p my_motorbike = Motorbike.new({:color => "red"})
p my_motorbike.needs_gas?
p my_motorbike.weave_through_traffic
p my_motorbike.brake
