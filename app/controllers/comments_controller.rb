# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = 'Success'
      redirect_to comment_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
