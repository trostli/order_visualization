class HubsController < ApplicationController

  def index
    @orders = Order.all

    if params['hub']
      @orders = Order.where(category_id: Hub.find_by(name: params['hub']).id)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @orders.to_json  }
    end
  end

  def import
    Hub.import(params[:file])
    redirect_to root_url, notice:"Hubs imported."
  end


end
