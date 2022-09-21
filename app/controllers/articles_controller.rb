class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new

    end

    def create
        # render plain: params[:article]
        @article = Article.new(article_params)
        # render plain: @article.inspect
        @article.save
        # redirect_to article_path(@article)
        redirect_to @article #same as above line
    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
end