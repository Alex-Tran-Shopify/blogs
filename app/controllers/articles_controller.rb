class ArticlesController < ActionController::Base
  before_action :set_article, only: [:show, :edit, :update, :destroy]

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
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was create successfully."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article update"
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def destroy
    puts "here in the delete"
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
