# Attr_reader, writers or accessors
#   Attr_reader initialize variables within a class and those variable are only
#   available to that class that can only be read from,they cannot be changed or 
#   written to.

# Example of Attr_reader on the car class

#    Attr_writers initialize variables with in a class and those variable are only
#    available to that class but those variables can be changed or written to.

#    Attr_accessor initialize variables with in a class and those variables are 
#    only available to that class but those variables can be both read and written
#    to.

# Public and Private Methods

#   Public Methods are methods (actions) that can be accessed out side thier 
#   defining class.


#   Private Methods are methods (actions) that can only be accessed with in their 
#   defining class it cannot be accessed outside the class and we defing them by
#   the keyword "private".

# Instance and Class methods

#   Instance methods are called on an instance of a class. 


#   Class methods are methods that are called on a class.

# my take on Instance & Class methods

# class Milk
#   def self.cow
#     puts 'class method'
#   end

#   def ice_cream
#     puts 'instance mehtod'
#   end
# end
# my_milk = Milk.new
# my_milk.cow                  #will return "class Method"
# my_milk.ice_cream            #will return  "instance Method"  

# Instance and  Class variables

#   Instance variables are created within a class and can be refrence by any 
#   method with in the class denoted by a single @ ex: @engine


#   Class variables are variables that are created within a class and are
#   available to all instance of a class. The are denoted by double @@ ex:(@@engine)


# Inheritance or Composition

#   Inheritance refers to how a class might aquire its attributes or methods.
#   If a class is a subclass of another then it inherits if attributes and methods
#   from that class unless they are modifided at the subclass leverl.

#   Ex: A car class might exist, have attributes of wheels, doors, engine.
#    When a class Ford is created and is set up to Inherit from the car class
#     its attributes are automatically copied from the car class..

#   Composition 
#   Composition refers to using other classes and modules rather than inhertance.
#   this can be done by calling functions on another class or from a module.


  class Car
    def initialize
      @wheels = 4
    end
# This show the example of seperation of concern and Law of Demeter. The method 
# operation depends on the brake and lights_on methods to operate.
    # def operation
    #   @brake = true
    #   @ lights_on   
    # end

#After

    def brakes
      @brakes = true                  #These are a example of seperation of concern
    end                                #Where each method address a seperate concern

    def lights_on                     #These are also example of Law of Demeter
      return [true, false].sample      #each method has no knowledge of the other
    end                                 #methods and do not interact with them.

  end

  class Ford < Car

    def initialize
      super
      @turbo = false
    end

    def has_turbo                     #This is an example of a method that is 
      return[true, false].sample      #special to this class alone and does not
    end                               #share this attribute with it parent, Car Class.
      
  end


  my_ford=Ford.new
 
 p my_ford.brakes
 p my_ford.lights_on
 p my_ford.has_turbo

  # This example was created to show Inheritance. The reason it is more suitable is
  # that it can gain most of its attributes from a car class and we do not have to
  #   redefine all the attributes just for this class.
