require 'spec_helper'

describe OrdersController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index, format: :json
      response.should be_success
    end
  end

end
