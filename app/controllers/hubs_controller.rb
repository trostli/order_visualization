class HubsController < ApplicationController

  def index
    @orders = Order.all

    if params['start_time'] && params['end_time']
      # @orders = Order.where("created_at.hour >= :start_time AND created_at.hour <= :end_time", {start_time: params[:start_time], end_time: params[:end_time] } )
      scoped_orders = []
      @orders.each do |order|
        if order.created_at.hour >= params['start_time'].to_i && order.created_at.hour < params['end_time'].to_i
          scoped_orders << order
        end
      end
      @orders = scoped_orders
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
