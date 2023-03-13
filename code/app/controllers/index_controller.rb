class IndexController < ApplicationController
    def index
        @ricerca=[]    #aggiungo oggetti tipo [isin,'azione'] e [username,'utente']
        @azioni=Azione.all
        @utenti=User.all
        i=0
        @azioni.each do |azione|
            @ricerca[i]=[azione.isin,'azione']
            i+=1
        end
        @utenti.each do |utente|
            @ricerca[i]=[utente.username,'utente']
            i+=1
        end
        @ricerca=@ricerca.sort
    end
    def cerca
        @cercato=params[:ricerca]
        puts @cercato
        cerca, tipo = @cercato.split(/\(|\)/)

        if tipo=='azione'
            id=Azione.where(isin:cerca).id
            redirect_to "/azione/"+id
        elsif tipo=='utente'
            id=User.where(username:cerca).id
            redirect_to "/users/"+id
        else
            #segnala errore
            redirect_to "index"
        end
    end

end