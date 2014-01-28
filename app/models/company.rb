require 'finmodeling'

class Company < ActiveRecord::Base

	def self.search_for(query)
		FinModeling::Company.find(company_params)
		#Company.where("name LIKE :query OR ticker LIKE :query", query: "%#{query}%")
	end

	

end
