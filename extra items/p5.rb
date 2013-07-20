class Vehicle
   @@WHEELS = 4
   def initialize(args)
      @color = args[:color]
   end

   def drive
      @status = :driving
   end

   def brake
      return ['stopped', 'moving'].sample    
   end

   def needs_gas?
      return [true,true,false].sample
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
      if self.brake == 'moving'
      return ['1st', '2nd', '3rd', '4th', '5th'].sample
      else
         return 'neutral'
      end
   end

end

my_car=Car.new({:color => "red"})
p my_car
p my_car.drive
p my_car.brake
p my_car.needs_gas?
p my_car.lights_on?
puts
greyhound=Bus.new({:color => "grey", :wheels => 10, :num_seats => 24, :fare => 2})
p greyhound
p greyhound.drive
p greyhound.brake
p greyhound.needs_gas?
p greyhound.admit_passenger("Joe", 3)
p greyhound.lights_on?
puts
hog=Motorbike.new({:color => "green"})
p hog
p hog.drive
p hog.brake
p hog.needs_gas?
p hog.weave_through_traffic
p hog.lights_on?
p hog.gear_in?
