class HeaderController < ApplicationController
    def header
        @ricerca=[]    #aggiungo oggetti tipo [isin,'azione',id] e [username,'utente',id]
        @azioni=Azioni.all
        @utenti=User.all
        @azioni.each do |azione|
            @ricerca.push([azione.isin,'azione',azione.id])
        end
        @utenti.each do |utente|
            @ricerca.push([utente.username,'utente',utente.id])
        end
    end
end
