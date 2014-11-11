require 'rails_helper'

RSpec.describe VideosController, :type => :controller do


describe "GET #index" do
  it "assings all videos to @ video" do
    video1 = create(:video, name: "technique")
    video2 = create(:video, name: "musicality")
    get :index
    expect(assigns(:video)).to eq([video1, video2])
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template :index
  end
end


  describe "Get #new" do
    before :each do
      @course = create(:course)
      @section = create(:section)
      @video = create(:video)
    end

      it "assings the new video to @video" do
        get :new, course_id: @course.id, section_id: @section.id
        expect(assigns(:video)).to be_a_new(Video)
      end

      it "renders the new course.section.video template" do
        get :new, course_id: @course.id, section_id: @section.id
        expect(response).to render_template :new
      end
  end


  describe "Get #show" do
    before :each do
      @course = create(:course)
      @section = create(:section)
      @video = create(:video)
    end

    it "assigns the correct course.section.video to @video" do
      get :show, course_id: @section.course_id, section_id: @video.section_id, id: @video.id
      expect(assigns(:video)).to eq(@video)
      expect(@section.id).to eq(@video.section_id)
    end

    it "renders the show template" do
      get :show, course_id: @section.course_id, section_id: @video.section_id, id: @video.id
      expect(response).to render_template :show
    end

  end

  describe "Get #edit" do
    before :each do
      @course = create(:course)
      @section = create(:section)
      @video = create(:video)
    end

    it "assings the correct course.section.video to @video" do
      get :edit, course_id: @section.course_id, section_id: @video.section_id, id: @video.id
      expect(assigns(:video)).to eq(@video)
    end

    it "renders the edit video template" do
      get :edit, course_id: @section.course_id, section_id: @video.section_id, id: @video.id
      expect(response).to render_template :edit
    end 

  end

  describe "POST #create" do
    before :each do
      @course = create(:course)
      @section = create(:section)
    end
    context "with valid params" do
      it "updates the database with a new video" do
       expect { post :create, course_id: @course.id, section_id: @section.id, video: attributes_for(:video) }.to change(Video, :count).by(1)
      end
      it "redirects to the video show page" do
        post :create, course_id: @course.id, section_id: @section.id, video: attributes_for(:video)
        expect(response).to redirect_to course_section_video_path(@course.id, @section.id, assigns(:video))
      end 
    end

    context "with invalid params" do
      it "does not update the database with a new video model" do
         expect { post :create, course_id: @course.id, section_id: @section.id, video: attributes_for(:invalid_video) }.to change(Video, :count).by(0)
      end
      it "redirects/rerenders the new template" do
        post :create, course_id: @course.id, section_id: @section.id, video: attributes_for(:invalid_video)
        expect(response).to redirect_to new_course_section_video_path
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @course = create(:course)
      @section = create(:section)
      @video = create(:video, name: 'newvideo')
    end

    context "with valid params" do
      it "assigns desired course.section.video to @video" do
        patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:video)
        expect(assigns(:video)).to eq(@video)
      end

      it "updates the content of @video" do
        patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:video)
        @video.reload
        expect(@video.name).to eq('learning')
      end

      it "it redirects to the @video show page" do
        patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:video)
        expect(response).to redirect_to course_section_video_path
      end
    end

    context "with invalid params" do
      it "assings desired course.section.video to @video" do
        patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:invalid_video)
        expect(assigns(:video)).to eq(@video)
      end

      it "does not update the content of @video" do
         patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:invalid_video)
        @video.reload
        expect(@video.name).to eq('newvideo')
      end

      it "redirects to the @video edit page" do
        patch :update, course_id: @section.course_id, section_id: @section.id, id: @video.id, video: attributes_for(:invalid_video)
        expect(response).to redirect_to edit_course_section_video_path
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @course = create(:course)
      @section = create(:section)
      @video = create(:video)
    end
    it "destorys the desired video" do
      expect { delete :destroy, course_id: @course.id, section_id: @section.id, id: @video.id }.to change(Video, :count).by(-1)
    end
  end

end
