# frozen_string_literal: true

class KlassesController < ApplicationController

  before_action :set_question, only: %i[rightful_author_question edit show update destroy]

  def index
    @klasses = current_student.klasses
    @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
    # @questions = @klass.questions

    #questions part
    @questions = @klass.questions.sort_by(&:count_votes).reverse
    @question_new = @klass.questions.create(question_params)
    @question_new.student_id = current_student.id
    if @question_new.save
      redirect_to klass_path(@klass)
      flash[:success] = "Votre question a bien été enregistrée"
    else
      redirect_to new_klass_question_path(@klass)
      flash[:warning] = "Votre question est trop courte"
    end
    respond_to do |format|
      format.html { redirect_to klass_path }
      format.js { }
    end



    @progression = Progression.new

    # for attendances
    @attendance = Attendance.new
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)

    # for student class
    @attendance = Attendance.find_by(klass: @klass, student: current_student)

    # for step
    @steps = @klass.steps

    respond_to do |format|
      format.html { redirect_to klass_path(@kalss) }
      format.js { }
    end

  end


  private

 

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:description, :student_id, :klass_id)
  end

  def rightful_author_question
    if teacher_signed_in? || @question.student == current_student
    else
      redirect_to klass_path(@question.klass), alert: "Seul l'auteur de la question ou le professeur de la classe peuvent supprimer une question"
    end
  end


end
