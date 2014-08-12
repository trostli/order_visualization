class HubsController < ApplicationController

  def index
    @orders = Order.all

    if params['category']
      @jobs = Job.where(category_id: Category.find_by(name: params['category']).id)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @orders.to_json  }
    end
  end

end
