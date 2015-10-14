class CreateBooksTableAndQuotesTable < ActiveRecord::Migration
	def up
		create_table :books do |t|
			t.string :author
			t.string :title
			t.integer :year
			t.timestamps null: true
		end

		create_table :quotes do |t|
			t.text :quote
			t.integer :book_id
			t.timestamps null: true
		end
	end
end
