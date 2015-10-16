require_relative 'arinit.rb'
require 'active_record'
require_relative 'models/Book.rb'
require_relative 'models/Quote.rb'

class Read
	def self.listBooks
		Book.find_each do |book| 
			#puts "#{book.title}\n===========================\n" +
		       	#"#{book.quotes.count} occurences of key words\n" +
			#"#{ (book.quotes.count/(book.wordcount*(1.0))) * 100000 } occurences per 1000000 words\n\n"
		end

		books = {}
		Book.all.each do |book|
			#book.nthing = 1
			books[book] = book.quotes.count/(book.wordcount*1.0)
		end
		books = books.sort_by{ |k, v| v }.reverse.to_h
		books.each_with_index do |book,i|
			b = book[0]
			puts "#{b.title} - #{b.author} - #{b.year}"
			puts '=============================='
			puts "#{b.quotes.count} total words"
			puts "#{((b.quotes.count / (b.wordcount*1.0))*1000).round(4)} occurrences of the word per 1 thousand" 
			puts "\n\n"
		end
	end

		
end
