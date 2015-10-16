require_relative 'arinit.rb'
Dir["migrations/*.rb"].each {|file| require file }

#setting up the table
CreateBooksTableAndQuotesTable.migrate(:up)
AddWordCountToBooks.migrate(:up)
