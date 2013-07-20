def convert_roster_format(roster)
  header = roster.shift
  updated_roster = roster[0..-1].map {|row| Hash[header.zip(row)]}
end

roster = [["Number", "Name", "Position", "Points per Game"],
          ["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
          ["9", "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
          ["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ], 
          ["7", "Sally Talls", "Power Forward", [18, 29, 26, 31, 19] ], 
          ["22", "MK DiBoux", "Small Forward", [11, 0, 23, 17, 0] ]]

updated_roster = convert_roster_format(roster)
p hashed_rosters = updated_roster[2]
# # => { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] }
p updated_roster[0]["Name"] == "Joe Schmo"   # outputs true
puts


def tic_tac_toe(array)
  random_xos = array
  1.upto(10) do
    tic_tac_toe = random_xos.sample(9)
    print @tic_tac_toe_board = Array.new(3) {tic_tac_toe.shift(3) }
    print "\n"
  end
end
tic_tac_toe(['X','O','X','O','X','O','X','O','X'])



