require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do



describe "GET #index" do
  it "renders the :index view" do 
    get :index
    expect(response).to render_template :index
  end

  it "assigns all courses to @course" do
    course1 = create(:course, name: "technique")
    course2 = create(:course, name: "musicality")
    get :index
    expect(assigns(:course)).to eq([course1, course2])
  end
 
end

describe "GET #show" do
  it "assigns the requested course to @course" do
    course = create(:course) 
    get :show, id: course
    expect(assigns(:course)).to eq(course)
  end

  it "renders the :show template" do 
    course = create(:course)
    get :show, id: course
    expect(response).to render_template :show
  end

end

describe "GET #edit" do
  it "assigns the requested course to @course" do
    course = create(:course)
    get :edit, id: course
    expect(assigns(:course)).to eq(course)
  end

  it "renders the edit template" do
    course = create(:course)
    get :edit, id: course
    expect(response).to render_template :edit
  end
end

describe "GET #new" do
  it "assigns a new course as @course" do
    get :new
    expect(assigns(:course)).to be_a_new(Course)
  end

  it "renders the new template" do
    get :new
    expect(response).to render_template :new
  end
end

describe "POST #create" do 
  context "with valid params" do
    it "creates a new course in the database" do
      expect { post :create, course: attributes_for(:course)}.to change(Course, :count).by(1)
    end

    it "assigns a newly created course as @course" do
      post :create, course: attributes_for(:course)
      expect(assigns(:course)).to be_valid
    end

    it "displays and success flash message"
      
    it "redirects to the created course" do
      post :create, course: attributes_for(:course)
      expect(response).to redirect_to course_path(assigns[:course])
    end
  end
  context "with invalid params" do
    it "does not create a new course" do
       expect { post :create, course: attributes_for(:invalid_course)}.to change(Course, :count).by(0)
    end

    it "assigns a newly created but unsaved course as @course" do
       post :create, course: attributes_for(:invalid_course)
       expect(assigns(:course)).to be_a_new(Course)
    end

    it "redirects to the new page" do
       post :create, course: attributes_for(:invalid_course)
       expect(response).to redirect_to(new_course_path)
    end

    it "displays a flash error message"

  end
end

describe "PATCH #update" do
  before :each do
    @course = create(:course,
        name: "musicality")
  end

  context "with valid params" do
    it "assigns the requested course as @course" do
      patch :update, id: @course, course: attributes_for(:course)
      expect(assigns(:course)).to eq(@course)
    end
    
    it "updates the requested course" do
      patch :update, id: @course, course: attributes_for(:course)
      @course.reload
      expect(@course.name).to eq('pedagogy')      
    end

    it "redirects to the updated course" do
       patch :update, id: @course, course: attributes_for(:course)
       expect(response).to redirect_to(@course)
    end

    it "displays a success flash message" 
  end

  context "with invalid params" do 
    it "assigns the course as @course" do
       patch :update, id: @course, course: attributes_for(:invalid_course)
      expect(assigns(:course)).to eq(@course)
    end

    it "does not update the database" do
      patch :update, id: @course, course: attributes_for(:invalid_course)
      @course.reload
      expect(@course.name).to eq('musicality')  
    end

    it "re-renders the edit template" do
      patch :update, id: @course, course: attributes_for(:invalid_course)
      expect(response).to redirect_to(edit_course_path(@course))
    end

    it "displays a flash error message" 


  end
end

describe "DELETE #destroy" do
  before :each do 
    @course = create(:course)
  end

  it "destroys the requested course" do
    expect{ delete :destroy, id: @course }.to change(Course, :count).by(-1)
  end

  it "flash success delete message"

  it "redirects to the course index" do
    delete :destroy, id: @course
    expect(response).to redirect_to(courses_url)
  end
end


end