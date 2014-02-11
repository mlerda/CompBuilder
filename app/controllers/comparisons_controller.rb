class ComparisonsController < ApplicationController

  def show
  	@company = Company.find(params[:company_id])

    @company_to_compare = Company.find(params[:id])
  
    @company_summary = @company.get_balance
    @company_to_compare_summary = @company_to_compare.get_balance


    @company_is = @company.get_income_statement
	@company_prior_period_is = @company.get_prior_period_income_statement
	@company_fy_is = @company.get_fy_income_statement
  
	@company_to_compare_is = @company_to_compare.get_income_statement
	@company_to_compare_prior_period_is = @company_to_compare.get_prior_period_income_statement
	@company_to_compare_fy_is = @company_to_compare.get_fy_income_statement
  end

# def favorite
# 	type = params[:type]
# 	if type == "favorite"
# 		current_user.favorites << @comparison
# 		redirect_to :back, notice: 'You favorited this'

# 	else
# 		redirect_to :back, notice: 'You favorited this'
# 	end
# end

	def favorite
		@company = Company.find(params[:company_id])
    	@company_to_compare = Company.find(params[:id])
    	#@comparison = Comparison.new(@company, @company_to_compare)
		#current_user.favorites << Comparison.new(@company, @company_to_compare)
	end




end
