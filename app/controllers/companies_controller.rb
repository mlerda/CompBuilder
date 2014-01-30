require 'finmodeling'

class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end 

	def show
		#@company = Company.find

		@company = FinModeling::Company.find(params[:id])		

		#company = FinModeling::Company.find(company_params)
		#company_name = company.name
	end

	def new
		
	end

	def create
  		@company = Company.new(company_params)
    	
	end



private

def set_company
    @company = Company.find(params[:id])
end


def company_params
	params.require(:company).permit(:name, :ticker, :stock_symbol, :cik, :sic) if params[:company]
end


def get_company_filing_url(company)
	company_info = FinModeling::Company.find(company)			
	
	filing_url = company_info.quarterly_reports.last.link
		
	return filing_url
end

		def get_filing(filing_url)
			return FinModeling::QuarterlyReportFiling.download(filing_url)
		end

		def filing(get_filing)
			filing = @get_filing.balance_sheet	
			
			return filing
		end		


		def print_reformulated_balance_sheet(filing)
			reformed_balance_sheet = @filing.reformulated

			summaries = []
			summaries << reformed_balance_sheet.net_operating_assets

			return print_summaries

		end


end
