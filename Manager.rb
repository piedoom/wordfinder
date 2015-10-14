#adds shit to the database bro
require 'sqlite3'


class Manager
        def initialize
		#create a table if none exists
		db = SQLite3::Database.new "love.db"
		#we want to clear the table every time, so dont worry about IF NOT EXISTS
		db.execute "DROP TABLE IF EXISTS metadata"
		db.execute "CREATE TABLE metadata(id INTEGER PRIMARY KEY, line TEXT, title TEXT, author TEXT)"
        end

        def addLine(line)
                puts line
        end
end
