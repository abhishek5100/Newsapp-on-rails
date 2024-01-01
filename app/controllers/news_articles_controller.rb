class NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.all
  end

  def new 
   @news_article = NewsArticle.new
  end


  def create
    @news_article = NewsArticle.new(news_article_params)

    if @news_article.save
      redirect_to @news_article
    else
      render 'new'
    end
  end


def edit 
@news_article =NewsArticle.find(params[:id])
end

def update
@news_article = NewsArticle.find(params[:id])

if @news_article.update(news_article_params)
  redirect_to @news_article
else
render :index
end
end

def destroy
  @news_article = NewsArticle.find(params[:id])
  if @news_article.destroy
    redirect_to news_articles_path
  else
    render :index
  end
end


private
def news_article_params
  params.require(:news_article).permit(:title, :sub_topic, :content, :category_id)
end

end
