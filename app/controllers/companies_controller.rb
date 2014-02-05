class CompaniesController < ApplicationController
	before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
		@companies = Company.all
	end 

	def show
		@company = Company.find(params[:id])
		@company_summary = @company.get_balance

	end

	def new		
	end

	def create
	end


private

def set_company
    @company = Company.find(params[:id])
end


def company_params
	params.require(:company).permit(:name, :ticker, :stock_symbol, :cik, :sic) if params[:company]
end










end
