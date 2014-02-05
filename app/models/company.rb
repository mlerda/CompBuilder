class Company < ActiveRecord::Base

	def self.search_for(query)
		Company.where("name LIKE :query OR ticker LIKE :query", query: "%#{query}%")
		#company = FinModeling::Company.find(company.ticker)
		#Company.where("name LIKE :query OR ticker LIKE :query", query: "%#{query}%")
	end

	def get_balance
		company_info = FinModeling::Company.find(self.ticker)
		filing_url = company_info.quarterly_reports.last.link
		get_filing = FinModeling::QuarterlyReportFiling.download(filing_url) 
		period = get_filing.balance_sheet.periods.last    
	  summaries = []
	  summaries << get_filing.balance_sheet.assets_calculation.summary(:period => period)
	  summaries << get_filing.balance_sheet.liabs_and_equity_calculation.summary(:period => period)
	  return summaries
	end



end