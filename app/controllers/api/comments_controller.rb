class Api::CommentsController < ApiController
  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    comment = Comment.create(comment_params)
    render json: comment
  end

  def destroy
    Comment.destroy(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(comment_params)
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :comment_text, :user_id, :recc_id)
  end
end
