class CommentsController < ApplicationController

  def create
    @circuit = Circuit.find(params[:circuit_id])
    @comment = @circuit.comments.create(comment_params)
    @comment.commenter = @current_driver.alias
    redirect_to circuit_path(@circuit)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
