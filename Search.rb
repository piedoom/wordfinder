require_relative 'Manager'


class Search

	#set the array of words for the application to be searched with
	def initialize wordArray
		@wordArray = wordArray 
		@manager = Manager.new
	end

	#set the author, title, etc
	def setMeta author, title
		@author = author
		@title = title
	end

	def search file
	 	open(file,'r') do |f|
        		#split the text by sentence
        		f.read.scan(/\s+[^.!?]*[.!?]/) do |sentence|
                		#split by line now since poetry is different
      		          	sentence = sentence.split("\n")
                		sentence.each do |line|
                        		line.scan(/\w*/) do |word|
						#compare the word and see if it should be added to database
						compare word, line
                        		end
                		end
        		end
		end
	end

	def compare word, line
		@wordArray.each do |compare|
			if word == compare
				addToDatabase line
			end
		end
	end

	def addToDatabase line
		@manager.addLine line
	end
end
