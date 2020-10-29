class ArticlesController < ApplicationController

    before_action :set_article, only:[:show, :edit, :update, :destroy]
    
    def show
       
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        
    end
    

    def create
        @article = Article.new(get_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
       
        if @article.update(get_params)
            flash[:notice] = "Article was edited successfuly."
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end
    
    def get_params
        params.require(:article).permit(:title, :description)
    end
    

    
end
