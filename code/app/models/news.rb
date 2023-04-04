class News < ApplicationRecord
    def self.get_news
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'
        
        url = URI("https://newsdata2.p.rapidapi.com/news?country=us&category=business&language=en")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["X-RapidAPI-Key"] = Rails.application.credentials.dig(API_KEY)
        request["X-RapidAPI-Host"] = 'newsdata2.p.rapidapi.com'
        
        response = http.request(request)

        parsed_response=JSON.parse(response.read_body)
        results=parsed_response["results"]
        News.destroy_all
        i=0
        j=0
        results.each do |res|
            n=News.new
            n.id=i
            n.titolo=res["title"]
            if res["description"].length >250
                tmp=res["description"]
                n.descrizione = tmp[0...250] + " [...]" #per stringhe troppo lunghe,prendo solo i primi 250 caratteri
            else
                n.descrizione=res["description"]
            end
            n.autore=res["source_id"]
            n.url=res["link"]
            if !res["image_url"] && j==0
                n.urlimg='fotonews1.jpg'
                j=j+1
            elsif !res["image_url"] && j==1
                n.urlimg='fotonews2.jpg'
                j=j+1
            elsif !res["image_url"] && j==2
                n.urlimg='fotonews3.jpg'
                j=j+1
            elsif !res["image_url"] && j==3
                n.urlimg='fotonews4.jpg'
                j=0
            else
                n.urlimg=res["image_url"]
            end
            i=i+1
            n.save!
        end
    end
end