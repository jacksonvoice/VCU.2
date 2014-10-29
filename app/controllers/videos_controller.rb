class VideosController < ApplicationController
before_filter :load_section


def index
  @video = @section.present? ? @section.videos : Video.all
end

def new
  @video = Video.new
end

def show
  @course = Course.find(params[:course_id])
  @section = Section.find(params[:section_id])
  @video = Video.find(params[:id])
end

def edit
  @course = Course.find(params[:course_id])
  @section = Section.find(params[:section_id])
  @video = Video.find(params[:id])
end

def create
  @course = Course.find(params[:course_id])
  @section = Section.find(params[:section_id])
  @video = @section.videos.build(video_params)
  if @video.save
    flash[:success] = "you created a new video!"
    redirect_to course_section_video_path( @section.course_id, @video.section_id, @video.id )
  else
    flash[:error] = "Invlaid attributes, please try again"
      redirect_to new_course_section_video_path(@course.id, @section.id)
  end
end

def update
  @course = Course.find(params[:course_id])
  @section = Section.find(params[:section_id])
  @video = Video.find(params[:id])
  if @video.update_attributes(video_params)
     flash[:success] = "the section has been updated"
      redirect_to [@course, @section, @video]
  else
    flash[:error] = "you must enter the correct information"
    redirect_to edit_course_section_video_path
  end
end

def destroy
  @course = Course.find(params[:course_id])
  @section = Section.find(params[:section_id])
  @video = Video.find(params[:id])
  @video.destroy
  redirect_to course_section_path(@course, @section)
end


private

    def video_params
      params.require(:video).permit(:name, :section_id)
    end

    def load_section
      @course = Course.find(params[:course_id]) if params[:course_id].present?
      @section = Section.find(params[:section_id]) if params[:section_id].present?
    end
end
