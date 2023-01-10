class NewsController < ApplicationController
    def index
        @notizia1=News.find(1)
        @notizia2=News.find(2)
        #@notizia3=News.find(3)
        #@notizia4=News.find(4)
        #@notizia5=News.find(5)
        #@notizia6=News.find(6)
        #@notizia7=News.find(7)
        #@notizia8=News.find(8)
        #@notizia9=News.find(9)
        #@notizia10=News.find(10)
        #@notizia11=News.find(11)
        #@notizia12=News.find(12)
    end

    def new
        @news=News.new
    end

    def create 
        @news=News.create
    end
end
