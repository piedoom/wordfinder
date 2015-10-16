require_relative 'arinit.rb'
require 'active_record'
require_relative 'models/Book.rb'
require_relative 'models/Quote.rb'
require 'fileutils'
require 'gruff'

class Read
	def self.listStats
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
			bookInfo(book[0])
		end
	end

	def self.bookInfo book
		#prints book info
		#this is kind of a model by now so we really should just return the data and print it in the main
		puts "#{book.title} - #{book.author} - #{book.year}"
		puts '=============================='
		puts "#{book.quotes.count} total words"
		puts "#{((book.quotes.count / (book.wordcount*1.0))*1000).round(4)} occurrences of the word per 1 thousand" 
		puts "\n\n"
	end

	def self.returnBooks
		#returns a list of all books
		list = []
		Book.all.each do |book|
			list.push(book)
		end
		return list
	end

	def self.returnBook id
		return Book.find(id)
	end

	def self.returnQuotes id
		quotes = []
		Book.find(id).quotes.each do |quote|
			quotes.push(quote.to_json)
		end
		return quotes
	end
	def self.exportJSON
		#todo: iterate filename
		books_json = []
		Book.all.each do |book|
			book_json = {
				'id' => book.id,
				'title' => book.title,
				'author' => book.author,
				'year' => book.year,
				'quotecount' => book.quotes.count,
			}
			books_json.push(book_json)
		end
		File.open("export/json-export.js","w") do |f|
			books_json = books_json.to_json
			f.write books_json
		end
	end

	def self.exportGraph
		#creating a bar graph
		g = Gruff::Bar.new('1500x800')
		g.title = 'Target word to Total word ratio per 1000'
		g.legend_box_size = 10
		g.legend_font_size = 12
		books = []
		Book.all.each do |book|
			g.data book.title, (book.quotes.count/(book.wordcount*1.0)*1000).round(3)
		end
		g.write('export/bar-export.png')
	end

		
end
