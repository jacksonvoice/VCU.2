
class SectionsController < ApplicationController
  
  def show
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
  end

  def edit 
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @section = @course.sections.build
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.build(section_params)
    if @section.save
      flash[:success] = "you created a new section!"
      redirect_to course_section_path( @section.course_id, @section.id )
    else
      flash[:error] = "Invlaid attributes, please try again"
      redirect_to new_course_section_path(@course)
    end
  end

private 

  def section_params
    params.require(:section).permit(:name, :course_id)    
  end


end
