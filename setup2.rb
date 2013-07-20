require 'sqlite3'
require 'csv'

$db = SQLite3::Database.new "politicians.db"

module PoliticianDB
	def self.setup
		rows = $db.execute(
			<<-SQL
			CREATE TABLE politicians(
				id INTEGER PRIMARY KEY AUTOINCREMENT, 
				name VARCHAR(64) NOT NULL, 
				party VARCHAR(64) NOT NULL, 
				location VARCHAR(64) NOT NULL, 
				grade_level_1 REAL NOT NULL, 
				grade_level_2 REAL NOT NULL, 
				yrs_in_congress REAL NOT NULL,
				dwi_score REAL NOT NULL
				);
			SQL
			)
	end

	def self.seed
		CSV.foreach("party.csv",:headers => true) do |row|
			$db.execute(
				"INSERT INTO politicians
				(name, party, location, grade_level_1, grade_level_2, yrs_in_congress, dwi_score)
				VALUES
				(?,?,?,?,?,?,?);",[row[0], row[1], row[2], row[3], row[4], row[5], row[6]]
			)
		end
	end


	def self.drop
		$db.execute_batch(
      <<-SQL
		DROP TABLE IF EXISTS `groups`;
      SQL
    )
	end

	def self.republicans
		$db.execute(
			'SELECT COUNT(party) from politicians
			 WHERE party = R
			 GROUP BY COUNT(party)';
		)
	end

	def self.democrats
		$db.execute(
			'SELECT COUNT(party) from politicians
			 WHERE party = D
			 GROUP BY COUNT(party)';
		)

	end

	def self.all_senators
		$db.execute(
			'SELECT COUNT(party) from politicians
			 WHERE party = D
			 GROUP BY COUNT(party)';
		)
	end	

end


class Politicians

	def initialize(*args)
		@name 			=args.fetch(:name)
		@party  		=args.fetch(:party)
		@location 		=args.fetch(:location)
		@grade_level_1 	=args.fetch(:grade_level_1)
		@grade_level_2 	=args.fetch(:grade_level_2)
		@yrs_in_congress=args.fetch(:yrs_in_congress)cd 
		@dwi_score 		=args.fetch(:dwi_score)

	end

	def add_to_group
		$db.execute(
      	"
        INSERT INTO politicians
          (@name, @party, @location, @grade_level_1, @grade_level_2, @yrs_in_congress, @dwi_score, created_at, updated_at)
        VALUES
          (?,?,?,?,DATETIME('now'),DATETIME('now'));",@name, @party, @location, @grade_level_1, @grade_level_2, @yrs_in_congress, @dwi_score
   	 )
  	end

  	 def delete_from_db
    	$db.execute(
    		"DELETE FROM politicians
     		WHERE id in ( SELECT id
      		FROM politicians
      		WHERE name = '#{@name}');"
   	 )
 	 end
end


# Name,Party,Location 1,Grade Level (since 1996),Grade Level (112th Congress),Years in Congress,DW1 Score

# PoliticianDB.setup
# PoliticianDB.seed
shereef = Politicians.new({:name=>,'Sen. Shereef Bishay', :party=> 'D', :location=> 'CA (37.638300000444815, -120.99958999997835)', :grade_level_1=> 12.37701267, :grade_level_2=> 12.19367, :yrs_in_congress=>17, :dwi_score=>-0.286)
shereef.add_to_group
