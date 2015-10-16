#requirements: 

libmagickwand-dev
imagemagick
sqlite3
ruby
bundler

#instructions

Clone the git repository
`git clone https://github.com/piedoom/wordfinder.git`

cd into the directory
`cd wordfinder`

If all dependencies are installed, bundle install
`bundle install`
If you have trouble installing Rmagick, make sure you have the dev library as listed above or similar depending on your system and distro

Set up the database using `setup.rb`. You only have to do this once.
`ruby setup.rb`

The files should automatically migrate

    ==  CreateBooksTableAndQuotesTable: migrating =================================
    -- create_table(:books)
       -> 0.1369s
    -- create_table(:quotes)
       -> 0.1132s
    ==  CreateBooksTableAndQuotesTable: migrated (0.2503s) ========================

    ==  AddWordcountToBooks: migrating ============================================
    -- add_column(:books, :wordcount, :integer)
       -> 0.1344s
    ==  AddWordcountToBooks: migrated (0.1345s) ===================================


Next, edit `main.rb`
`vim main.rb`

Find `wordArray` and edit it to have the values that you want.
`wordArray = ['try','hard','so','far','end','even','matter']

These are the words the progam will check against.

Add some texts to the `corpus/` directory with any name as a .txt file, (although any filetype should theoretically work). Create this `corpus` directory in the project root if none is already created.
The format for files is to have the first line contain data about the file - it is set up like this:
`Author||Book Title||Release Date`

These values just help the program, but do not technically need to be filled in.


After this is set, run the program.
`ruby main.rb`

