# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_klass

  def new
    @question_new = Question.new
  end

  def create
    @question_new = @klass.questions.create(question_params)
    @question_new.student_id = current_student.id
    if @question_new.save
      redirect_to klass_path(@klass)
      flash[:success] = "Votre question a bien été enregistrée"
    else
      redirect_to klasses_path
    end
  end

  def update
    @question.update(question_params)
    redirect_to klass_path(@klass)
    flash[:success] = "Votre question a bien été mise à jour"
  end

  def destroy
    @question.destroy
    redirect_to klasses_path
    flash[:success] = "Votre question a bien été supprimée"
  end

  private

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end

  def question_params
    params.require(:question).permit(:description, :student_id, :klass_id)
  end
end
