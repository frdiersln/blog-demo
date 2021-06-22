class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
         flash[:success] = "Article was successfully created"
         redirect_to article_path(@article)
        else
         render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
         flash[:success] = "Article was updated"
         redirect_to article_path(@article)
        else
         flash[:success] = "Article was not updated"
         render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:success] = "Article was deleted"
        redirect_to articles_path
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end

end