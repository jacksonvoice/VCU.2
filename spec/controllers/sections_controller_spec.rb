require 'rails_helper'


RSpec.describe SectionsController, :type => :controller do




  describe "Get #show" do
    before :each do
      @course = create(:course)
      @section = create(:section)
    end

      it "assigns the correct course.section to @section" do
        get :show, course_id: @section.course_id, id: @section.id
        expect(assigns(:section)).to eq(@section)
        expect(@course.id).to eq(@section.course_id)
      end

      it "renders the section :show template" do
        get :show, course_id: @section.course_id, id: @section.id
        expect(response).to render_template :show
      end

  end

  describe "GET #edit" do
    before :each do
      @course = create(:course)
      @section = create(:section)
    end

    it "assings the correct course.section to @section" do
      get :edit, course_id: @section.course_id, id: @section.id
      expect(assigns(:section)).to eq(@section)
      expect(@course.id).to eq(@section.course_id)
    end

    it "renders the section :edit template" do
      get :edit, course_id: @section.course_id, id: @section.id
      expect(response).to render_template :edit
    end

  end

  describe "Get #new" do
    before :each do 
      @course = create(:course)
      @section = create(:section)
    end

    it "assings the a new section to @section" do
      get :new, course_id: @course.id
      expect(assigns(:section)).to be_a_new(Section)
    end

    it "renders the course.sections :new template" do
      get :new, course_id: @course.id
      expect(response).to render_template :new
    end

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new course section in the database" do
        course = create(:course)
        expect { post :create, course_id: course.id, section: attributes_for(:section) }.to change(Section, :count).by(1)
      end

      it "redirectes to the course.section show page" do
        course = create(:course)
        post :create, course_id: course.id, section: attributes_for(:section)
        expect(response).to redirect_to course_section_path(course.id, assigns(:section))
      end
    end

    context "with invalid params" do
      it "does not save the new section in the database" do
       course = create(:course)
       expect { post :create, course_id: course.id, section: attributes_for(:invalid_section)}.to change(Section, :count).by(0)
     end
      it "re-renders the :new course.section page" do
        course = create(:course)
        post :create, course_id: course.id, section: attributes_for(:invalid_section)
        expect(response).to redirect_to new_course_section_path(course)
      end
      it "redirects to the correct course id page" do
        course = create(:course)
        post :create, course_id: course.id, section: attributes_for(:invalid_section)
        expect(response).to redirect_to(new_course_section_path)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      before :each do 
          @course = create(:course)
          @section = create(:section, name: "section1")
      end
      it "finds the correct course.section assigns @section" do 
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:section)
        expect(assigns(:section)).to eq(@section)
      end
      it "updates the content of @section" do
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:section)
        @section.reload
        expect(@section.name).to eq("exercises")
      end
      it "redirects to the show page @section updated" do
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:section)
        expect(response).to redirect_to(course_section_path)
      end
    end

    context "with invalid attributes " do
      before :each do 
          @course = create(:course)
          @section = create(:section, name: "section1")
      end
      it "finds the correct course.section assigns @section" do
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:invalid_section)
        expect(assigns(:section)).to eq(@section)
      end
      it "does not update the content of @section" do
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:invalid_section)
        @section.reload
        expect(@section.name).to eq("section1")
      end
      it "redirects back to the :edit page @section" do
        post :update, course_id: @section.course_id, id: @section.id, section: attributes_for(:invalid_section)
        expect(@section.course_id).to eq(1)
        expect(@section.id).to eq(1)
        expect(response).to redirect_to(edit_course_section_path(@section.course_id, @section.id))
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @course = create(:course)
      @section = create(:section)
    end
    it "removes the requested section from the database" do
      expect{ delete :destroy, course_id: @section.course_id, id: @section.id }.to change(Section, :count).by(-1)
    end

    it "redirects to the course index" do
      delete :destroy, course_id: @section.course_id, id: @section.id
      expect(response).to redirect_to(course_path)
    end
  end 

end
