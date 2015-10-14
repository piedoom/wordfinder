require_relative 'Manager'


class Search

	#set the array of words for the application to be searched with
	def initialize wordArray
		@wordArray = wordArray 
		@manager = Manager.new
	end

	#set the author, title, etc
	def setMeta metadata
		#split by "||"
		metadata = metadata.split("||")
		@author = metadata[0]
		@title = metadata[1]
		@year = metadata[2]
	end

	def search folder
		Dir.glob("#{folder}/*") do |file|
	 	open(file,'r') do |open|
			#make sure text is valid UTF
			validOpen = open.read.encode('UTF-8','binary',invalid: :replace, undef: :replace, replace: '')

			#per format, the corpus text will contain the title and author in the first line
			setMeta validOpen.lines.first

			#put the book in our database
			@manager.addBook @author, @title, @year

			#tell the user what we're searching
			printf "Searching - %-40s %s\n", @author, @title


			#split the text by sentence and make sure it's valid UTF-8
			validOpen.scan(/\s+[^.!?]*[.!?]/) do |sentence|
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
	end

	def compare word, line
		@wordArray.each do |compare|
			if word == compare
				addToDatabase line
			end
		end
	end

	def addToDatabase line
		@manager.addLine line, @title
	end
	def stats
		@manager.stats
	end	

end
