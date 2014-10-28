
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

  def update
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
      if @section.update_attributes(section_params)
      flash[:success] = "the section has been updated"
      redirect_to [@course, @section]
    else
      flash[:error] = "you must enter the correct information"
      redirect_to edit_course_section_path
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to course_path(@course)

  end

private 

  def section_params
    params.require(:section).permit(:name, :course_id) 
  end


end
