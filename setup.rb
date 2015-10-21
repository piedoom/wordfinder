require_relative 'arinit.rb'
Dir["migrations/*.rb"].each {|file| require_relative file }

#setting up the table
CreateBooksTableAndQuotesTable.migrate(:up)
AddWordcountToBooks.migrate(:up)
