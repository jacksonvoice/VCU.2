class CoursesController < ApplicationController

def index
  @course = Course.all
end

def show
  @course = Course.find(params[:id])
end

def edit
	@course = Course.find(params[:id])
end

def new
	@course = Course.new
end

def create
	@course = Course.new(course_params)
	if @course.save
		flash[:success] = "you created a new course"
		redirect_to @course
	else
		flash[:error] = "Your course must have a valid name"
		redirect_to new_course_path
	end
end

def update
	@course = Course.find(params[:id])
	if @course.update(course_params)
		flash[:success] = "the course has been updated"
		redirect_to course_path(@course)
	else
		flash[:error] = "Please enter a valid name"
		redirect_to edit_course_path(@course)
	end
end

def destroy
	@course = Course.find(params[:id])
	@course.destroy
	redirect_to courses_path
end


private

	def course_params
		params.require(:course).permit(:name)
	end 

end