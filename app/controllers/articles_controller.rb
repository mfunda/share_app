class ArticlesController < ApplicationController

	before_action :find_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@articles = Article.paginate(:per_page => 9, :page => params[:page]).all.order("created_at DESC")
	end

	def new
		@article = current_user.articles.build
	end

	def show
		@comments = Comment.where(article_id: @article)
	end

	def edit
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def upvote
		@article.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@article.downvote_from current_user
		redirect_to :back
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def find_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :content, :link, :image)
	end
end
