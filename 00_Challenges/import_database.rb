require 'csv'
require 'sqlite3'

def csv_array(filename)
  array =[]
  CSV.foreach(filename) {|line| array << line}
  array
end

class Politician

  attr_accessor :name, :party, :location, :grade_level_1_1996, :grade_level_112th, :yrs_in_congress, :dwi_score

  def initialize (name, party, location, grade_levei_1_1996, grade_level_112th, yrs_in_congress, dwi_score)
    @name               = name
    @party              = party
    @location           = location
    @grade_levei_1_1996 = grade_levei_1_1996
    @grade_level_112th  = grade_level_112th 
    @yrs_in_congress    = yrs_in_congress 
    @dwi_score          = dwi_score

    
  end
