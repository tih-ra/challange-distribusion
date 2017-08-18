require 'rails_helper'


RSpec.describe RoutesController, type: :controller do
  
  
  describe "GET /routes/" do
    it "should return list with routes" do
      route = FactoryGirl.create(:route)
      
      get :index, as: :json
      
      expect(assigns(:routes)).to eq([route])
    end
  end

  describe "POST /routes/" do
    context "with valid data" do
      it "should return route and status Created" do
        
        params = { 
          passphrase: Faker::Beer.name, 
          source: ["sentinels", "sniffers", "loopholes"].sample, 
          start_node: ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample, 
          end_node: ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample,
          start_time: "2010-09-06T12:27:00",
          end_time: "2010-10-06T11:22:02"
        
         }
         
        get :create, method: :post, params: params, as: :json
        expect(response).to have_http_status(:created)
        
      end
    end

    context "with invalid data" do
      it "should return 422 and fail to save" do
    
        params = { 
          passphrase: Faker::Beer.name, 
          start_node: ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample, 
          end_node: ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample,
          start_time: "2010-10-06T11:22:02",
          end_time: "2010-10-06 11:22:02",
         }
    
        get :create, method: :post, params: params, as: :json
    
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq({"error"=>"Validation failed: Source can't be blank, End time ts Invalid DateTime"})
        expect(Route.count).to eq(0)
    
      end
    end
  end

end
