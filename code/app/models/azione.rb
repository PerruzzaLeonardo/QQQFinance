class Azione < ApplicationRecord
    attr_accessor :prezzo

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

        for n in 0..len
            url = URI("https://yh-finance.p.rapidapi.com/stock/v2/get-summary?symbol="+isin[n])
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["X-RapidAPI-Key"] = '077744100emsh424c27eb08db68fp1e9c55jsna3e887dea294'
            request["X-RapidAPI-Host"] = 'yh-finance.p.rapidapi.com'
            
            response = http.request(request)
            
            res=JSON.parse(response.read_body)

            prezzo=res["financialData"]["currentPrice"]["raw"] #prezzo è di tipo float quando lo inserisco
=begin     
            #controllo vecchio prezzo per capire se dover mandare la mail
            prec=Azione.where(isin:isin[n].to_s).first.prezzo #ERRORE: PREC RISULTA NIL ANCHE SE NEL DB PREZZO È UN INTERO
            puts isin[n]
            puts prec
            
            if prezzo>prec*1.05 or prezzo<prec*0.95 #se prezzo è salito piu di 5% o sceso di piu di 5%, invia notifica
                oscillazione_prezzo(isin[n])
            else
                puts "oscillazione non rilevante"
            end
=end        
            
            nome=res["quoteType"]["shortName"]
            settore=res["summaryProfile"]["sector"]
            paese=res["summaryProfile"]["country"]
            marketcap=res["summaryDetail"]["marketCap"]["raw"]
            volume=res["summaryDetail"]["volume"]["raw"]
            pe=res["defaultKeyStatistics"]["forwardPE"]["raw"]
            ps=res["summaryDetail"]["priceToSalesTrailing12Months"]["raw"]
            pb=res["defaultKeyStatistics"]["priceToBook"]["raw"]
            divyield=res["summaryDetail"]["trailingAnnualDividendYield"]["raw"]*100
            roe=res["financialData"]["returnOnEquity"]["raw"]
            if roe==nil
                roe=0
            else
                roe=roe*100
            end
            roa=res["financialData"]["returnOnAssets"]["raw"]*100
            debteq=res["financialData"]["debtToEquity"]["raw"]
            opmargin=res["financialData"]["operatingMargins"]["raw"]*100
            ebitda=res["financialData"]["ebitdaMargins"]["raw"]*100
            
            azioni[n].update(nome:nome,settore:settore,paese:paese,marketcap:marketcap,prezzo:prezzo,volume:volume,pe:pe,ps:ps,pb:pb,divyield:divyield,roe:roe,roa:roa,debteq:debteq,opmargin:opmargin,ebitda:ebitda)
        end

=begin    PRIMO INSERIMENTO IN DB

       Azione.destroy_all
       temp=["AAPL", "ABNB", "ADBE", "ADI", "ADP", "ADSK", "AEP", "ALGN", "AMAT", "AMD", "AMGN", "AMZN", "ANSS", "ASML", "ATVI", "AVGO", "AZN", "BIIB", "BKNG", "BKR", "CDNS", "CEG", "CHTR", "CMCSA", "COST", "CPRT", "CRWD", "CSCO", "CSGP", "CSX", "CTAS", "CTSH", "DDOG", "DLTR", "DXCM", "EA", "EBAY", "ENPH", "EXC", "FANG", "FAST", "FISV", "FTNT", "GFS", "GILD", "GOOG", "GOOGL", "HON", "IDXX", "ILMN", "INTC", "INTU", "ISRG", "JD", "KDP", "KHC", "KLAC", "LCID", "LRCX", "LULU", "MAR", "MCHP", "MDLZ", "MELI", "META", "MNST", "MRNA", "MRVL", "MSFT", "MU", "NFLX", "NVDA", "NXPI", "ODFL", "ORLY", "PANW", "PAYX", "PCAR", "PDD", "PEP", "PYPL", "QCOM", "REGN", "RIVN", "ROST", "SBUX", "SGEN", "SIRI", "SNPS", "TEAM", "TMUS", "TSLA", "TXN", "VRSK", "VRTX", "WBA", "WBD", "WDAY", "XEL", "ZM", "ZS"]
        for i in temp
            a=Azione.new(isin:i)
            a.save!
        end
        
=end

    end
end
