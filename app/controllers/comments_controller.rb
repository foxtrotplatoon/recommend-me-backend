class CommentsController < ApplicationController

  def new
  end

  private

  def set_var
    @comment = Comment.find(params[:id])
  end
end
