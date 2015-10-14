require_relative 'Search'

wordArray = ['loves','love','loving','lovers','loved']

puts '(p)rocess, (r)ead'

cmd = gets.chomp

if cmd == 'p'
	search = Search.new wordArray 
	#directory to search through
	search.search 'corpus'
	search.stats
end

if cmd == 'r'

end
