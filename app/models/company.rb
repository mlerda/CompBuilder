class Company < ActiveRecord::Base
	has_many :comparisons

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

	def get_income_statement		
		company_info = FinModeling::Company.find(self.ticker)
		filing_url = company_info.quarterly_reports.last.link
		get_filing = FinModeling::QuarterlyReportFiling.download(filing_url) 
		period = get_filing.income_statement.periods[4]    
		income_statement = get_filing.income_statement.summary(:period => period)
		return income_statement
	end

	def get_prior_period_income_statement
		company_info = FinModeling::Company.find(self.ticker)
		filing_url = company_info.quarterly_reports.last.link
		get_filing = FinModeling::QuarterlyReportFiling.download(filing_url) 
		prior_period = get_filing.income_statement.periods[1]
		prior_period_income_statement = get_filing.income_statement.summary(:prior_period => prior_period)
		return prior_period_income_statement
	end

	def get_fy_income_statement
		company_info = FinModeling::Company.find(self.ticker)
		filing_url = company_info.annual_reports.last.link
		get_filing = FinModeling::AnnualReportFiling.download(filing_url) 
		fy_period = get_filing.income_statement.periods[1]    
		fy_income_statement = get_filing.income_statement.summary(:fy_period => fy_period)
		return fy_income_statement
	end







end