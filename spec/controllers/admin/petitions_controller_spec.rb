require 'spec_helper'

describe Admin::PetitionsController do
  subject{ response }

  describe 'GET new' do
    before{ get :new }
    it{ should be_successful }
    it{ assings(:petition).should be_new_record }
  end

  describe 'GET index' do
    before do
      Factory(:petition)
      get :index, :format => 'json'
    end
    it{ should be_successful }
    its(:body){ should == Petition.all.to_json }
    it{ assigns(:petitions).should == Petition.all }
  end
end
