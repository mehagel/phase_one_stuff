# def tic_tac_toe
#   a=["x", "o", "x", "o", "x", "x", "o", "x", "o"]
#   1.upto(10)  do
#    tic_tac_toe = a.sample(9)
#    p board_grid = Array.new(3) { tic_tac_toe.shift(3) }
#   end
# end
# p tic_tac_toe



def convert_roster_format
              roster = [["Number", "Name", "Position", "Points per Game"],
                        ["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
                        ["9", "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
                        ["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ], 
                        ["7", "Sally Talls", "Power Forward", [18, 29, 26, 31, 19] ], 
                        ["22", "MK DiBoux", "Small Forward", [11, 0, 23, 17, 0] ]]
  
  puts roster[1..-1].map {|row| Hash[roster[0].zip(row)]}
end
p convert_roster_format
puts 
