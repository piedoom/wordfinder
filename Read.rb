require_relative 'arinit.rb'
require 'active_record'
require_relative 'models/Book.rb'
require_relative 'models/Quote.rb'

class Read
	def self.listBooks
		books = Hash.new
		Book.all.each do |book|
			books[book.title] = book.quotes.count
		end
		
		books = books.sort_by{ |title, amount| amount}.reverse
		puts books
	end
end
