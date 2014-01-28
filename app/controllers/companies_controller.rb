require 'finmodeling'

class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end 

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
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


end
