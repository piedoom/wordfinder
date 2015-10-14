require_relative 'Search'

wordArray = ['loves','love','loving','lovers','loved']

search = Search.new wordArray 
#directory to search through
search.search 'corpus'
search.stats
