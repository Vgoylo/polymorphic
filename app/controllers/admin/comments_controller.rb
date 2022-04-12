class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
      if comment.destroy
        flash[:success] = 'Success'
        redirect_to comment_path
      else
        flash[:error] = 'Error'
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

