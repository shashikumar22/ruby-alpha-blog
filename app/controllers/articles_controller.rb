class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :show, :update, :destroy]
	
	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		byebug
    @article.user = User.first
		if @article.save
    	flash[:success] = "Article was successfully saved"
    	redirect_to article_path(@article)
    else
    	render 'new'
    end	

	end

	def show	
	end

	def destroy
		if @article.destroy
			flash[:notice] = "Article deleted successfully"
			redirect_to articles_path
		end	
	end

	def edit
	end

	def update
 
    if @article.update(article_params)
    	flash[:notice] = "Article was successfully updated"
    	redirect_to articles_path
    else
    	render 'edit'
    end
	end

	private

		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :description)
		end	
end