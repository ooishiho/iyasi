class User::EvaluationsController < ApplicationController
before_action :ensure_normal_user, only: %i[create]

  def create
    evaluation = Evaluation.new(evaluation_params)
    evaluation.post_item_id = params[:post_item_id]
    evaluation.user_id = current_user.id
    evaluation.save
    redirect_to user_post_item_path(evaluation.post_item_id)
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:point)
  end
end
