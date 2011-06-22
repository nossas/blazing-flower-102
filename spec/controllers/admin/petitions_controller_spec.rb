require 'spec_helper'

describe Admin::PetitionsController do
  before { @admin = Factory(:admin) }

  subject{ response }

  describe 'GET new' do
    context 'as a guest' do
      it { expect { get :new }.to raise_error(CanCan::AccessDenied) }
    end

    context 'as a logged in user' do
      before do
        sign_in @admin
        get :new
      end

      it{ should be_successful }
      it{ assigns(:petition).should be_new_record }
    end
  end

  describe 'GET index' do
    before do
      Factory(:petition)
    end

    context 'as a guest' do
      it { expect { get :index }.to raise_error(CanCan::AccessDenied) }
    end

    context 'as a logged in user' do
      before do
        sign_in @admin
        get :index, :format => 'json'
      end

      it{ should be_successful }
      its(:body){ should == Petition.all.to_json }
      it{ assigns(:petitions).should == Petition.all }
    end
  end
end
