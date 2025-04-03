# frozen_string_literal: true

class PostCommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[edit destroy update]
  def new
    @comment = PostComment.new(post_id: @post.id)
  end

  def create
    @comment = PostComment.new(post_comment_params.merge(post_id: @post.id))
    @comment.post_id = @post.id

    if @comment.save
      redirect_to @post, notice: 'Комментарий добавлен'
    else
      @comments = @post.post_comments
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(post_comment_params)
      redirect_to @post, notice: 'Комментарий обновлён'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Комментарий удалён'
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def set_comment
    @comment = @post.post_comments.find(params[:id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end
