# frozen_string_literal: true

class UpvotesController < ApplicationController
  before_action :find_question
  before_action :set_klass

  def create
    if already_vote?
      flash[:error] = "Vous avez déja voté"
    else
      @question.upvotes.create(student_id: current_student.id)
      # if @upvote.save
      #    flash[:success] = "Votre question a bien été supprimée"
      # else
      #   flash[:alert] = " Votre vote n'a pas fonctionné"
      # end
    end
    redirect_to klass_path(@klass)
  end

  def destroy; end

  private

  def vote_params
    params.require(:upvote).permit(:student_id)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def already_vote?
    Upvote.where(student_id: current_student.id, question_id: params[:question_id]).exists?
  end

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end
end
