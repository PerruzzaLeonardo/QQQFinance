class Azione < ApplicationRecord
    has_many :comment 
    include ActionMailer::MailHelper

    def self.aggiorna_azioni
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'

        azioni=Azione.all

        isin=[]
        i=0
        len=azioni.length-1
        n=0
        for i in 0..len
            isin[i]=azioni[i].isin
            i+=1
        end
        #isin contiene tutti gli isin inseriti nel database

        for n in 0..len        # AGGIORNATE CON ROUND(2) FINO A ID=88 manca da SNPS compreso in poi
            url = URI("https://yh-finance.p.rapidapi.com/stock/v2/get-summary?symbol="+isin[n])
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["X-RapidAPI-Key"] = '077744100emsh424c27eb08db68fp1e9c55jsna3e887dea294'
            request["X-RapidAPI-Host"] = 'yh-finance.p.rapidapi.com'
            
            response = http.request(request)
            
            res=JSON.parse(response.read_body)

            @prezzo=res["financialData"]["currentPrice"]["raw"].round(2) #prezzo è di tipo float quando lo inserisco


            #controllo vecchio prezzo per capire se dover mandare la mail
            prec=Azione.where(isin:isin[n]).first.prezzo 
            @ticker=isin[n]
            puts prec
            if @prezzo>prec*1.05 or @prezzo<prec*0.95 #se prezzo è salito piu di 5% o sceso di piu di 5%, invia notifica
                @variazione = ((@prezzo - prec) / prec) * 100
                portafogli=Wallet.where(azione:isin[n])
                x=0
                while x<portafogli.length
                    @utente=User.where(username:portafogli[x].user).first
                    PriceMailer.oscillazione_prezzo(@utente,@ticker,@prezzo,@variazione).deliver_later
                    x=x+1
                end
            end


            nome=res["quoteType"]["shortName"]
            settore=res["summaryProfile"]["sector"]
            paese=res["summaryProfile"]["country"]
            marketcap=res["summaryDetail"]["marketCap"]["raw"]
            volume=res["summaryDetail"]["volume"]["raw"]
            pe=res["defaultKeyStatistics"]["forwardPE"]["raw"].round(2)
            ps=res["summaryDetail"]["priceToSalesTrailing12Months"]["raw"].round(2)
            pb=res["defaultKeyStatistics"]["priceToBook"]["raw"]
            if pb==nil
                pb=0
            else
                pb=pb.round(2)
            end
            divyield=res["summaryDetail"]["trailingAnnualDividendYield"]["raw"]*100.round(2)
            roe=res["financialData"]["returnOnEquity"]["raw"]
            if roe==nil
                roe=0
            else
                roe=roe*100.round(2)
            end
            roa=res["financialData"]["returnOnAssets"]["raw"]*100.round(2)
            debteq=res["financialData"]["debtToEquity"]["raw"]
            if debteq==nil
                debteq=0
            else
                debteq=debteq.round(2)
            end
            opmargin=res["financialData"]["operatingMargins"]["raw"]*100.round(2)
            ebitda=res["financialData"]["ebitdaMargins"]["raw"]*100.round(2)
            
            azioni[n].update(nome:nome,settore:settore,paese:paese,marketcap:marketcap,prezzo:@prezzo,volume:volume,pe:pe,ps:ps,pb:pb,divyield:divyield,roe:roe,roa:roa,debteq:debteq,opmargin:opmargin,ebitda:ebitda)
        end


=begin PRIMO INSERIMENTO IN DB

       Azione.destroy_all
       n=0
       temp=["AAPL", "ABNB", "ADBE", "ADI", "ADP", "ADSK", "AEP", "ALGN", "AMAT", "AMD", "AMGN", "AMZN", "ANSS", "ASML", "ATVI", "AVGO", "AZN", "BIIB", "BKNG", "BKR", "CDNS", "CEG", "CHTR", "CMCSA", "COST", "CPRT", "CRWD", "CSCO", "CSGP", "CSX", "CTAS", "CTSH", "DDOG", "DLTR", "DXCM", "EA", "EBAY", "ENPH", "EXC", "FANG", "FAST", "FISV", "FTNT", "GFS", "GILD", "GOOG", "GOOGL", "HON", "IDXX", "ILMN", "INTC", "INTU", "ISRG", "JD", "KDP", "KHC", "KLAC", "LCID", "LRCX", "LULU", "MAR", "MCHP", "MDLZ", "MELI", "META", "MNST", "MRNA", "MRVL", "MSFT", "MU", "NFLX", "NVDA", "NXPI", "ODFL", "ORLY", "PANW", "PAYX", "PCAR", "PDD", "PEP", "PYPL", "QCOM", "REGN", "RIVN", "ROST", "SBUX", "SGEN", "SIRI", "SNPS", "TEAM", "TMUS", "TSLA", "TXN", "VRSK", "VRTX", "WBA", "WBD", "WDAY", "XEL", "ZM", "ZS"]
        for i in temp
            a=Azione.new(id:n,isin:i)
            n+=1
            a.save!
        end
=end

    end
end
