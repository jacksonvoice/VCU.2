require 'rails_helper'


RSpec.describe SectionsController, :type => :controller do


  describe "GET index" do
    it "assigns all sections as @sections" do
      section = Section.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:sections)).to eq([section])
    end
  end

  describe "GET show" do
    it "assigns the requested section as @section" do
      section = Section.create! valid_attributes
      get :show, {:id => section.to_param}, valid_session
      expect(assigns(:section)).to eq(section)
    end
  end

  describe "GET new" do
    it "assigns a new section as @section" do
      get :new, {}, valid_session
      expect(assigns(:section)).to be_a_new(Section)
    end
  end

  describe "GET edit" do
    it "assigns the requested section as @section" do
      section = Section.create! valid_attributes
      get :edit, {:id => section.to_param}, valid_session
      expect(assigns(:section)).to eq(section)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Section" do
        expect {
          post :create, {:section => valid_attributes}, valid_session
        }.to change(Section, :count).by(1)
      end

      it "assigns a newly created section as @section" do
        post :create, {:section => valid_attributes}, valid_session
        expect(assigns(:section)).to be_a(Section)
        expect(assigns(:section)).to be_persisted
      end

      it "redirects to the created section" do
        post :create, {:section => valid_attributes}, valid_session
        expect(response).to redirect_to(Section.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved section as @section" do
        post :create, {:section => invalid_attributes}, valid_session
        expect(assigns(:section)).to be_a_new(Section)
      end

      it "re-renders the 'new' template" do
        post :create, {:section => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested section" do
        section = Section.create! valid_attributes
        put :update, {:id => section.to_param, :section => new_attributes}, valid_session
        section.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested section as @section" do
        section = Section.create! valid_attributes
        put :update, {:id => section.to_param, :section => valid_attributes}, valid_session
        expect(assigns(:section)).to eq(section)
      end

      it "redirects to the section" do
        section = Section.create! valid_attributes
        put :update, {:id => section.to_param, :section => valid_attributes}, valid_session
        expect(response).to redirect_to(section)
      end
    end

    describe "with invalid params" do
      it "assigns the section as @section" do
        section = Section.create! valid_attributes
        put :update, {:id => section.to_param, :section => invalid_attributes}, valid_session
        expect(assigns(:section)).to eq(section)
      end

      it "re-renders the 'edit' template" do
        section = Section.create! valid_attributes
        put :update, {:id => section.to_param, :section => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested section" do
      section = Section.create! valid_attributes
      expect {
        delete :destroy, {:id => section.to_param}, valid_session
      }.to change(Section, :count).by(-1)
    end

    it "redirects to the sections list" do
      section = Section.create! valid_attributes
      delete :destroy, {:id => section.to_param}, valid_session
      expect(response).to redirect_to(sections_url)
    end
  end

end
