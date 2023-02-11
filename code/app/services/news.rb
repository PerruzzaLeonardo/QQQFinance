require 'http'
class news
    def self.get_news
        begin
            newsapi=News.new("432875b764b04a5cb743fe26e813a01e")
            response=newsapi.get_top_headlines(country:'it',category:'business')
        rescue => exception
            
        end
        results=response.parse['results']
        results each do |r|
            n=News.new
            n.autore=r[author]
            n.titolo=r[title]
            n.descrizione=r[description]
            n.url=r[url]
            n.urlimg=r[urlToImage]
            n.save!
        end
        return true
    end 
end

