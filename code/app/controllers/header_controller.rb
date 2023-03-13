class HeaderController < ApplicationController
    def partial
        @ricerca=[]    #aggiungo oggetti tipo [isin,'azione',id] e [username,'utente',id]
        @azioni=Azione.all
        @utenti=User.all
        i=0
        @azioni.each do |azione|
            @ricerca[i]=[azione.isin,'azione',azione.id]
            i+=1
        end
        @utenti.each do |utente|
            @ricerca[i]=[utente.username,'utente',utente.id]
            i+=1
        end
    end
end
