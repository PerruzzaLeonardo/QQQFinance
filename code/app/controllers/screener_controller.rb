class ScreenerController < ApplicationController
    def index
        @variabili = Azione.all
        
    end
end
