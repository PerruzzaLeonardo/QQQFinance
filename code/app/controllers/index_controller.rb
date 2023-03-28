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
    end
    def cerca
        @cercato=params[:ricerca]
        puts @cercato
        cerca, tipo = @cercato.split(/\(|\)/)
        az=Azione.all
        ut=User.all
        x=0

        if tipo=='azione'
            az.each do |i|
                if i.isin==cerca
                    x=0
                    break
                else
                    x=1
                end
            end
            if x=1
                flash[:inesistente] = "Non esiste una azione con l'ISIN immesso"
                redirect_to "/.."
            else
                id=Azione.find_by(isin:cerca).id
                id=id.to_s
                redirect_to "/azione/"+id
            end
        elsif tipo=='utente'
            ut.each do |i|
                if i.username==cerca
                    x=0
                    break
                else
                    x=1
                end
            end
            if x=1
                flash[:inesistente] = "Non esiste un utente con tale username"
                redirect_to "/.."
            else
                id=User.find_by(username:cerca).id
                id=id.to_s
                redirect_to "/users/"+id
            end
        else
            #segnala errore
            flash[:inesistente] = "Non esiste una azione con l'ISIN immesso oppure un utente con tale username"
            redirect_to "/.."
        end
    end

end