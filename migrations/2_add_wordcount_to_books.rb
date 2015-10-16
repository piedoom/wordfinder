class AddWordcountToBooks < ActiveRecord::Migration
	def up
		add_column :books, :wordcount, :integer
	end
	def down
		remove_column :books, :wordcount
	end
end
