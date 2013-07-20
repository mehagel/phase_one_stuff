module Veterinaran
	def need_vet?
		@need_vet = [true, false].sample
	end
end


class Zoo
	attr_reader:add_animals , :animals      #Attr_reader.. creates a method that can be read from. 

	def initialize
		@enclosure_clean = false
		@animals = @animals || []
	end


	def add_animals(animals)
		@animals << animals
	end


	def enclosure_clean!(animals)
		@enclosure_clean = [true, false].sample
	end
end


class Animal
	include Veterinaran										#The animal class is Composed of the module Veterinaran	
	attr_accessor :hungry										#Attr_accessor created methods that can be both read from and written to.
	attr_reader :warm_blooded								#Attr_reader.. creates a method that can be read from

	@@LEGS = 4															#class variable that is available to all inhertiated classes and instance of each class.

	def initialize(color)
		@warm_blooded = true
		@hungry = true					#Instance variable that is only available to the instance of the class.
		@color, @legs = color	
		@legs = @@LEGS

	end

	def hungry														#Instance method it is only availabe to an instance of a class.
		@hungry
	end

	def eat!
		@hungry = false
	end

	def self.species_class						#class method availabe to all classes and is called via self.
		'class method'
	end

end


class Mammal < Animal 									#This class inhertiates 

	def initalize(color,legs)
		super
		
	end

	def eat!
		@hungry = false
		
		"munch munch"
	end

end

class Reptile < Animal

	@LEGS = 4

	def initialize(color)
		super
		@warm_blooded = false
		@legs = @@LEGS
		
	end

	def eat!
		@hungry = false
		
		"chomp chomp"
	end

end

class Bird < Animal
	attr_reader :has_feathers, :lays_eggs

	@@LEGS = 2

	def initialize(color)
		super
		@legs = @@LEGS
		@has_feathers = true
		@lays_eggs = true
		
	end

	def eat!
		@hungry = false
		
		"squak squak"
	end

private
	def lays_eggs
		puts 'Birds lay eggs..fool! that\'s not private'
	end



end

zoo = Zoo.new

elephant = Mammal.new('Grey')         #Created instance (elephant) of the Mammal class
crocodile= Reptile.new('Grey')		#Created instance (crocodile) of the Reptile class
bald_eagle=Bird.new('Brown')		#Created instance (bald_eagle) of the Bird class
parrot=Bird.new("Grey")			#Created instance (parrot) of the Bird class

zoo.add_animals(elephant)		#Added animals to the zoo instance of the Zoo class
zoo.add_animals(crocodile)
zoo.add_animals(bald_eagle)
zoo.add_animals(parrot)

p elephant.hungry ==true
p crocodile.hungry == true
p bald_eagle.hungry ==true
puts

p elephant.eat! == "munch munch"
p crocodile.eat!	== "chomp chomp"
p bald_eagle.eat!	== "squak squak"

p elephant.hungry ==false
p crocodile.hungry == false
p bald_eagle.hungry   ==false

puts
p "Is the elephant's enclosure clean: #{zoo.enclosure_clean!(elephant)}"  #Calling upon instance method of the zoo instance.
p "Is the crocodile's enclosure clean: #{zoo.enclosure_clean!(crocodile)}"
p "Is the bald_eagle's enclosure clean: #{zoo.enclosure_clean!(bald_eagle)}"

puts
p "There are #{zoo.animals.length} animals in the zoo."

puts
p "Does the elephant need a vet? #{elephant.need_vet?}"             #Calling upon instance method aquired by a module
p "Does the bald eagle need a vet? #{bald_eagle.need_vet?}"
p "Does the crocodile need a vet? #{crocodile.need_vet?}"

puts
p elephant.warm_blooded == true		#Calling on Instance methods
p crocodile.warm_blooded == false
p bald_eagle.warm_blooded == true

puts
p bald_eagle.has_feathers == true	#calling upon Instance methods
p parrot.has_feathers == true

puts
p Bird.species_class		# These are examples of class methods. They are methods that are called by the class
p Mammal.species_class 		# and not the instance of the class.
p Reptile.species_class
p Animal.species_class 
puts

bald_eagle.send(:lays_eggs)
parrot.send(:lays_eggs)            #These are examples of calling upon a private methodd within an instance of a class.

# Attr_reader, writers or accessors
#   Attr_reader initialize methods within a class and those variable are only
#   available to that class that can only be read from,they cannot be changed or 
#   written to.

#    Attr_writers initialize methods with in a class and those variable are only
#    available to that class but those methods can be changed or written to.

#    Attr_accessor initialize methods with in a class and those methods are 
#    only available to that class but those methods can be both read and written
#    to.

# Public and Private Methods

#   Public Methods are methods that can be called by everyone, no access control
 # 	a classes instance methods are by default public  


#   Private Methods are methods (actions) that cannot be called by an explict receiver.
# 	the receiver is always self. This means private methods can only be called in
#   in the context of the current object

# Instance and Class methods

#   Instance methods are called on an instance of a class. 


#   Class methods are methods that are called on a class and are access via the self. .


# Instance and  Class variables

#   Instance variables are created within an istance of a  class and can be refrence by any 
#   method with in that instance of class denoted by a single @ ex: @engine


#   Class variables are variables that are created within a class and are
#   available to all instance of a class. The are denoted by double @@ ex:(@@engine)


# Inheritance or Composition

#   Inheritance refers to how a class might aquire its attributes or methods.
#   If a class is a subclass of another then it inherits if attributes and methods
#   from that class unless they are modifided at the subclass level.


#   Composition 
#   Composition refers to using other classes and modules rather than inhertance.
#   this can be done by calling functions on another class or from a module. call upon a module 
#  with "Include"


