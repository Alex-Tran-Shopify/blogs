class ArticlesController < ActionController::Base
  def show
    @article = Article.find(params[:id])
  end
  def index 
    @articles = Article.all
  end
  def new 

  end
  def create 
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    # render plain: @article.inspect
    redirect_to article_path(@article)
  end
end
