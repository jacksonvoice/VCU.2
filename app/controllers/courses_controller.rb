class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

def index
  @course = Course.all
end

end