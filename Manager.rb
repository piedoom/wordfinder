#adds shit to the database bro
require_relative 'enviornment.rb'
require 'sqlite3'
require 'fileutils'

class Manager
        def initialize
		#clear our database
		Book.delete_all
		Quote.delete_all

		#@db = SQLite3::Database.new "love.db"
		
		#create a table for the books
		#@db.execute "CREATE TABLE books(author TEXT, title TEXT UNIQUE PRIMARY KEY, year INTEGER)"		
		
		#create a table for the metadata
		#@db.execute "CREATE TABLE metadata(line TEXT, book_id TEXT, FOREIGN KEY (book_id) REFERENCES books(title))"

	end

	def addBook author, title, year
		#Insert into our books table
		#@db.execute "INSERT OR IGNORE INTO books (author, title, year) VALUES (?, ?, ?)", [author,title,year]
		Book.create(author: author, title: title, year: year)
		#return the book ID so we can later use it when adding a quote
		return Book.where(title: title).first
	end

	def addLine line, title, book_id
		#@db.execute "INSERT INTO metadata (line, book_id) VALUES (?, ?)", [line,title]
		Quote.create(quote: line, book_id: book_id)
	end

	def stats
		Book.all.each do |book|
			puts book
		end
	end
end


class Book < ActiveRecord::Base
	has_many :quotes
end

class Quote < ActiveRecord::Base
	belongs_to :book
end
