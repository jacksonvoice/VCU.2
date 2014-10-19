require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

describe "GET #index" do
  it "renders the :index view" do 
    get :index
    expect(response).to render_template :index
  end

  it "creates a course" do
    course = create(:course)
    expect(course).to be_valid
  end

  it "assigns all courses to @course" do
    course1 = create(:course, name: "technique")
    course2 = create(:course, name: "musicality")
    get :index
    expect(assigns(:courses)).to eq([course1, course2])
  end
 
end

describe "GET #show" do
  it "assigns the requested course to @course"
  it "renders the :show template"
end

describe "GET #edit" do
  it "assigns the requested course to @course"
  it "renders the edit template"
end

describe "GET #new" do
  it "assigns a new course as @course"
  it "renders the new template"
end

describe "POST #create" do 
  context "with valid params" do
    it "creates a new course"
    it "assigns a newly created course as @course"
    it "displays and success flash message"
    it "reirects to the created course"
  end
  context "with invalid params" do
    it "does not create a new course"
    it "assigns a newly created but unsaved coures as @course"
    it "redirects to the new page"
    it "displays a flash error message"
  end
end

describe "PUT #update" do
  context "with valid params" do
    it "updates the requested course"
    it "assigns the reuqested course as @course"
    it "redirects to the updated course"
  end

  context "with invalid params" do 
    it "assigns the course as @course"
    it "does not update the database"
    it "re-renders the edit template"
  end
end

describe "DELETE #destroy" do
  it "destroys the reuqested course"
  it "redirects to the course index"
end


end