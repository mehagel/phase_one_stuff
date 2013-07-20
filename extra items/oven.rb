class Batch
  attr_reader :batches_of_cookies

  def initialize
    @in_oven = false
    @batches_of_cookies = batches_of_cookies
    @batches_of_cookies = @batches_of_cookies || []
  end

  def cookie(cookie)
    @batches_of_cookies << cookie
  end

  def in_oven(cookie)
    @in_oven = true
  end

end

class Cookie

  attr_reader :bake_time

  def initialize(cookie_type, bake_time)
    @cookie_type  = cookie_type
    @bake_time    = bake_time
    @done         = false

  end

  def bake
    cook_time = 0
    until  @bake_time == cook_time
      sleep(0.5)
      cook_time += 1
      if @bake_time/4 >= cook_time
        puts  "Your cookies are Doughy"
        p @bake_time - cook_time
      elsif @bake_time/2 >= cook_time
        puts "Your cookies are Almost Ready"
        p @bake_time - cook_time
      elsif @bake_time/1.2 >= cook_time
        puts "Your cookies are Almost Ready"
        p @bake_time - cook_time
      else @bake_time > cook_time
        @done = true
      end
    end
    "Your cookies are Ready"  
  end

  def done?
    @done
  end

end

batch           = Batch.new
peanut_butter   =Cookie.new('peanut_butter', 12)
chocolate_chip  =Cookie.new('chocolate_chip', 11)
oatmeal         =Cookie.new('oatmeal', 10)

batch.cookie(peanut_butter)
batch.cookie(oatmeal)
batch.cookie(chocolate_chip)

p peanut_butter.bake_time == 12
p oatmeal.bake_time       == 10
p chocolate_chip.bake_time== 11

p batch.in_oven(peanut_butter) == true
p batch.in_oven(chocolate_chip)== true
p batch.in_oven(oatmeal)       == true
puts

p chocolate_chip.bake
p oatmeal.bake
p peanut_butter.bake

puts

p peanut_butter.done?
p oatmeal.done?
p chocolate_chip.done?

p "Total batches of cookies #{batch.batches_of_cookies.length}"
