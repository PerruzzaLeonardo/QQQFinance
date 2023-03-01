class AzioneController < ApplicationController
    def index

    end

    def show
      @curr_user=User.find(params[:id])
      @azione =Azione.find(params[:id])
    end

    def new
        @azione=Azione.new
    end

    def create
        @azione = Azione.new(azione_params)
    
        respond_to do |format|
          if @azione.save
            format.html { redirect_to movie_url(@azione), notice: "azione was successfully created." }
            format.json { render :show, status: :created, location: @azione }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @azione.errors, status: :unprocessable_entity }
          end
        end
      end 

    private
    def set_movie
      @azione = Azione.find(params[:id])
    end

    def azione_params
      params.require(:azione).permit(:nome, :isin, :settore, :paese, :marketcap, :prezzo, :volume, :pe, :ps, :pb, :divyield, :roe, :roa, :debteq, :opmargin, :ebitda,)
    end
end