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

      it "re-renders the :new course.section page"
      it "redirects to the correct course id page"
    end
  end

  describe "PATCH #update" do
  end

  describe "DELETE #destroy" do
  end 

end
