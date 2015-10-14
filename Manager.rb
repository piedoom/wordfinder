#adds shit to the database bro
require 'sqlite3'
require 'fileutils'

class Manager
        def initialize
		#we always want to start out new, so let's just delete the database and start over.
		FileUtils.rm('love.db')
		@db = SQLite3::Database.new "love.db"
		#create a table for the books
		@db.execute "CREATE TABLE books(author TEXT, title TEXT UNIQUE PRIMARY KEY, year INTEGER)"		
		#create a table for the metadata
		@db.execute "CREATE TABLE metadata(line TEXT, book_id TEXT, FOREIGN KEY (book_id) REFERENCES books(title))"
	end

	def addBook author, title, year
		#Insert into our books table
		@db.execute "INSERT OR IGNORE INTO books (author, title, year) VALUES (?, ?, ?)", [author,title,year]
	end

	def addLine line, title
		@db.execute "INSERT INTO metadata (line, book_id) VALUES (?, ?)", [line,title]
	end

	def stats
		@db.execute "SELECT 
	end
end
