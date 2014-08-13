class OrderssController < ApplicationController

  def import
    Order.import(params[:file])
    redirect_to root_url, notice:"Orders imported."
  end

end
