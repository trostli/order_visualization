class OrdersController < ApplicationController

  def index
    @orders = Order.all

    scope_orders_to_dates_in_time_range if params['start_time'] && params['end_time']
    scope_orders_to_date_range if (params['start_date']  && params['end_date']) && (params['start_date'] != "" && params['end_date'] != "")
    scope_orders_to_hub if params['hub_number']

    respond_to do |format|
      # format.html { render status: 200 }
      format.json { render json: @orders.to_json, status: 200  }
    end
  end

  def import
    Order.import(params[:file])
    redirect_to root_url, notice:"Orders imported."
  end

  private

  def scope_orders_to_hub
    @orders = Order.where(hub_id: params['hub_number'].to_i)
  end

  def scope_orders_to_dates_in_time_range
    scoped_orders = []
    start_time = params['start_time'].to_i
    end_time = params['end_time'].to_i
    @orders.each do |order|
     scoped_orders << order if order.created_at.localtime.hour >= start_time && order.created_at.localtime.hour < end_time
    end
    @orders = scoped_orders
  end

  def scope_orders_to_date_range
    start_date = Time.parse(params['start_date'])
    end_date = Time.parse(params['end_date'])
    @orders = Order.where(created_at: start_date..end_date)
  end

end
