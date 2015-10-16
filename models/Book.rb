require 'active_record'

class Book < ActiveRecord::Base
	has_many :quotes
end
