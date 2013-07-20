require 'sqlite3'
require 'csv'

$db = SQLite3::Database.new "politicians.db"

module PoliticiansDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE politicians (
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
    array=[]
    CSV.foreach('politician_data.csv', :headers => true, :header_converters => :symbol) do |row|
      # p row[0]
      $db.execute(
        <<-SQL
        INSERT INTO politicians
        (name, party, location, grade_level_1, grade_level_2, yrs_in_congress, dwi_score)
        VALUES 
        ('#{row[0]}','#{row[1]}','#{row[2]}','#{row[3]}','#{row[4]}','#{row[5]}','#{row[6]}');
       SQL
      )
    end
  end
end

# PoliticiansDB.setup
# sqki


class Politician
    attr_accessor :id, :name, :party, :location, :grade_level_1, :grade_level_2, :yrs_in_congress, :dw1_score

    def initialize(attributes={})
      @id        = nil || attributes[:id]
      @name             = attributes[:name]
      @party            = attributes[:party]
      @location         = attributes[:location]
      @grade_level_1    = attributes[:grade_level_1]
      @grade_level_2    = attributes[:grade_level_2]
      @yrs_in_congress  = attributes[:yrs_in_congress]
      @dw1_score        = attributes[:dw1_score]
    end


    def republican_rep
      $db.execute("SELECT * FROM politician WHERE party = 'R' GROUP BY name = '%REP%'")
    end

    def democrates_rep
      $db.execute("SELECT * FROM politician WHERE party = 'D'")
    end

     def republican_rep
      $db.execute("SELECT * FROM politician WHERE name = '%REP%' , name = '%SEN%'")
    end

    def add_menber

    end
      
end
