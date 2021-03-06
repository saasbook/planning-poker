require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ActivitiesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Activity. As you add validations to Activity, be sure to
  # adjust the attributes here as well.
  before {ApplicationController.any_instance.stubs(:record_activity)}

  let(:valid_attributes) {{
      user_id: '1',
      activity_type: 'anonym'
  }}

  # let(:invalid_attributes) {
  # }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActivitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:default_format) { 'application/json' }

  describe "GET #index" do
    it "returns a success response" do
      activity = Activity.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      activity = Activity.create! valid_attributes
      get :show, {:id => activity.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Activity" do
        expect{
          xhr  :post, :create, {:activity => valid_attributes}, valid_session, format: :json
        }.to change(Activity, :count).by(1)
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, {:activity => invalid_attributes}, valid_session
    #     expect(response).to be_success
    #   end
    # end
  end

  describe "DELETE #destroy" do
    it "destroys the requested activity" do
      activity = Activity.create! valid_attributes
      expect {
        xhr :delete, :destroy, {:id => activity.to_param}, valid_session, format: :json
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Activity.create! valid_attributes
      xhr :delete, :destroy, {:id => activity.to_param}, valid_session, format: :json
      expect(response.code).to eql('204')
    end
  end

end
