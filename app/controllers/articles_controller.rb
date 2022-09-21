class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        # render plain: params[:article]
        @article = Article.new(article_params)
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article created succesfully."
            # redirect_to article_path(@article)
            redirect_to @article #same as above line
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article updated succesfully."
            redirect_to @article
        else
            render :edit #another way to render partial
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path

    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
end