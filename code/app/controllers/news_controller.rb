class NewsController < ApplicationController
    def index
        @notizia0=News.find(0)
        @notizia1=News.find(1)
        @notizia2=News.find(2)
        @notizia3=News.find(3)
        @notizia4=News.find(4)
        @notizia5=News.find(5)
        @notizia6=News.find(6)
        @notizia7=News.find(7)
        @notizia8=News.find(8)
        @notizia9=News.find(9)
    end

    def new
        @news=News.new
    end

    def create
        @news = News.new(news_params)
    
        respond_to do |format|
          if @news.save
            format.html { redirect_to news_url(@news), notice: "news was successfully created." }
            format.json { render :show, status: :created, location: @news }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @news.errors, status: :unprocessable_entity }
          end
        end
      end 
    
  

    private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:titolo, :descrizione, :autore, :url, :urlimg)
    end
end