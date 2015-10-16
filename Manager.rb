#adds shit to the database bro
require_relative 'arinit.rb'
require 'sqlite3'
require 'fileutils'

#require models
require_relative 'models/Book'
require_relative 'models/Quote'

class Manager
        def initialize
	end

	def addBook author, title, year, wordcount
		Book.create(author: author, title: title, year: year, wordcount: wordcount)
		#return the book ID so we can later use it when adding a quote
		return Book.where(title: title).first
	end

	def clearDatabase
		#clear our database
		Book.delete_all
		Quote.delete_all
	end

	def addLine line, title, book_id
		Quote.create(quote: line, book_id: book_id)
	end

	def stats
		Book.all.each do |book|
			puts book
		end
	end
end



