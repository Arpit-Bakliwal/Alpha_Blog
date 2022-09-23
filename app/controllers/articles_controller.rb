class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        # render plain: params[:article]
        @article = Article.new(article_params)
        @article.user = current_user
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
        if @article.update(article_params)
            flash[:notice] = "Article updated succesfully."
            redirect_to @article
        else
            render :edit #another way to render partial
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path

    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end