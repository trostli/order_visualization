class OrdersController < ApplicationController

  def index
    @orders = Order.all

    if params['start_time'] && params['end_time']
      scoped_orders = []
      start_time = params['start_time'].to_i
      end_time = params['end_time'].to_i
      @orders.each do |order|
       scoped_orders << order if order.created_at.localtime.hour >= start_time && order.created_at.localtime.hour < end_time
      end
      @orders = scoped_orders
    end

    if params['start_date'] != "" && params['end_date'] != ""
      start_date = Time.parse(params['start_date'])
      end_date = Time.parse(params['end_date'])
      @orders = Order.where(created_at: start_date..end_date)
    end

    if params['hub_number']
      @orders = Order.where(hub_id: params['hub_number'].to_i)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @orders.to_json  }
    end
  end

  def import
    Order.import(params[:file])
    redirect_to root_url, notice:"Orders imported."
  end

end
