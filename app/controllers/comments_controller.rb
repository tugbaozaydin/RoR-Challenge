class CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:article).all
  end
   def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end
  def show
    get_comment
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
  def get_comment
    @comment = Comment.find(params[:id])
  end
end
