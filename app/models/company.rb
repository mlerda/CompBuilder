require 'finmodeling'

class Company < ActiveRecord::Base

	def self.search_for(query)
		company = Company.find(query)
		#company = FinModeling::Company.find(company.ticker)
		#Company.where("name LIKE :query OR ticker LIKE :query", query: "%#{query}%")
	end

	

end
