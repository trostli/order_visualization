class HubsController < ApplicationController

  def index
    @hubs = Hub.all

    if params['hub_number']
      @hubs = Hub.find(params['hub_number'].to_i)
    end

    respond_to do |format|
      format.html
      format.json { render :json => @hubs.to_json  }
    end
  end

  def import
    Hub.import(params[:file])
    redirect_to root_url, notice:"Hubs imported."
  end


end

