
class SubjectController < ApplicationController


  def new
    @student = Student.find(params[:student_id])
    @subject = @student.subjects.build
  end


  def create
    @student = Student.find(params[:student_id])
    @subject = @student.subjects.create(subject_params)
    if !@subject.nil?
      redirect_to subject_show_path(student_id: @student.id, id: @subject.id)
    else
      redirect_to menu_path
    end
  end

  def show
      @student = Student.find(params[:student_id])
      @subject = @student.subjects.find_by(id: params[:id])
    end



   private  def subject_params
    params.require(:subject).permit(:subjectname, :subjectInstructor)
  end


end
