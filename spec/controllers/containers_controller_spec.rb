require 'rails_helper'
RSpec.describe ContainersController, type: :controller do
  render_views

  let(:valid_attributes) {
    {name: 'test container'}
  }

  let(:invalid_attributes) {
    {container_items: []}
  }

  let(:recipe) do
    create(:recipe)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContainersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all containers as @containers" do
      container = Container.create(valid_attributes)
      container.add_item(recipe)

      get :index, format: :json
      expect(assigns(:containers)).to eq([container])
    end
  end

  describe "GET #show" do
    it "assigns the requested container as @container" do
      container = Container.create(valid_attributes)

      get :show, id: container.to_param, format: :json
      expect(assigns(:container)).to eq(container)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Container" do
        expect {
          post :create, container: valid_attributes, format: :json
        }.to change(Container, :count).by(1)
      end

      it "assigns a newly created container as @container" do
        post :create, container: valid_attributes, format: :json
        expect(assigns(:container)).to be_a(Container)
        expect(assigns(:container)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved container as @container" do
        post :create, container: invalid_attributes, format: :json
        expect(assigns(:container)).to be_a_new(Container)
      end

      it "renders 'unprocessable_entity' status" do
        post :create, container: invalid_attributes, format: :json
        expect(response.status).to eq 422
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'new name'}
      }

      it "updates the requested container" do
        container = Container.create(valid_attributes)
        put :update, id: container.to_param, container: new_attributes, format: :json
        container.reload
        expect(container.name).to eq 'new name'
      end

      it "assigns the requested container as @container" do
        container = Container.create! valid_attributes
        put :update, id: container.to_param, container: valid_attributes, format: :json
        expect(assigns(:container)).to eq(container)
      end
    end

    context "with invalid params" do
      it "assigns the container as @container" do
        container = Container.create(valid_attributes)
        put :update, id: container.to_param, container: invalid_attributes, format: :json
        expect(assigns(:container)).to eq(container)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested container" do
      container = Container.create! valid_attributes
      expect {
        delete :destroy, id: container.to_param, format: :json
      }.to change(Container, :count).by(-1)
    end
  end

end
