class ComparisonsController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  
  def show
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

end
