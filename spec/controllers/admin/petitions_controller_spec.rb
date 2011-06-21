require 'spec_helper'

describe Admin::PetitionsController do
  describe 'GET index' do
    before do
      Factory(:petition)
      get :index, :format => 'json'
    end
    subject{ response }
    it{ should be_successful }
    its(:body){ should == Petition.all.to_json }
    it{ assigns(:petitions).should == Petition.all }
  end
end
