class Politician < ActiveRecord::Base
	has_and_belongs_to_many :projects

	def name_with_initial
    	self.name
  	end
end
