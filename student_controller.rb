# frozen_string_literal: true

class StudentController < ApplicationController
  def menu; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to show_path(@student), notice: 'Student was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def info; end

  def infoU; end

  def destroy
    @student = Student.find_by(name: params[:custom_field]) || @student = Student.find(params[:id])
    if @student == nil
      redirect_to info_path, notice: 'Not exists'
    elsif @student.delete
      redirect_to menu_path, notice: 'Student was successfully deleted.'
    else
      render :info, notice: 'error'
    end
  end

  def display
    @students = Student.all
    #@subjects = @student.subjects.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student =  Student.find(params[:id])
  end

  def update
    @student =  Student.find(params[:id])
    if @student.update(student_params)
      redirect_to show_path(@student), notice: 'Student has been successfully updated'
    else
      render :infoU
    end
  end

  def index
    @student = Student.find_by(name: params[:up_field])
    if !@student.nil?
      redirect_to edit_path(@student)
    else
      render :infoU
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :roll, :cgpa, :section)
  end
end
