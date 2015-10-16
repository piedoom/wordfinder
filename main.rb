require_relative 'Search'
require_relative 'Read'

wordArray = ['loves','love','loving','lovers','loved']

search = Search.new wordArray 
cont = true
while cont
	puts '(p)rocess, (r)ead, (q)uit, (l)istbook, (e)xport'
	cmd = gets.chomp
	if cmd == 'p'
		puts "Are you sure?  Processing will delete all items in the database and start over again.\nThe process can take a while, depending on how many words and source texts are being searched. (y/n)"
		cmd = gets.chomp
		if cmd == 'y'
			#clear our database
			search.clearDatabase
			#directory to search through
			search.index 'corpus'
			puts 'Finished Search.'
		else
			puts 'Aborting.'
		end
	end

	if cmd == 'r'
		Read.listStats
	end

	if cmd == 'l'
		booklist = Read.returnBooks
		booklist.each do |book|
			puts "#{book.id} - #{book.title}"
		end
		puts 'Select a book to get more statistics? ([BOOK ID]/n)'
		cmd = gets.chomp
		unless cmd == 'n'
			#should check to make sure is integer
			book = Read.returnBook(cmd.to_i)
			Read.bookInfo book

			puts 'Print all quotes from which words were extracted? (y/n)'
			cmd = gets.chomp
			unless cmd == 'n'
				quotes = Read.returnQuotes book
				quotes.each_with_index do |quote, i|
					puts "#{i + 1} - #{quote.quote} \n\n"
				end
			end
		end
	end

	if cmd == 'q'
		cont = false
	end

	if cmd == 'e'
		puts '(j)son, (g)raph'
		cmd = gets.chomp
		if cmd == 'j' 
			Read.exportJSON
		elsif cmd == 'g'
			Read.exportGraph
		end
	end
end
