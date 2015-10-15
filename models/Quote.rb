require 'active_record'

class Quote < ActiveRecord::Base
	belongs_to :book
end
