class CommentsController < ApplicationController
  helper_method :current_driver

  def create
    @circuit = Circuit.find(params[:circuit_id])
    @comment = @circuit.comments.new(comment_params)
    @comment.commenter = current_user.driver.alias
    if @comment.save
      redirect_to circuit_path(@circuit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
