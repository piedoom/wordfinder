require_relative 'Search'
require_relative 'Read'

wordArray = ['loves','love','loving','lovers','loved']

search = Search.new wordArray 
cont = true
while cont
	puts '(p)rocess, (r)ead, (q)uit'
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
		Read.listBooks
	end

	if cmd == 'q'
		cont = false
	end
end
