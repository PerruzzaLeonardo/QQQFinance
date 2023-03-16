class ScreenerController < ApplicationController
    def index
        @risultati = Azione.all
        @aggiunta = Azione.all
        @soluzione = Azione.all

    end

    def new
        @screener = Screener.new
    end

    def create
        @screener = Screener.new(screener_params)
        if @screener.save
            redirect_to root_path
        else
            render :new
        end
    end
    
    def aggiorna
        @paese_scelto = params[:paesescelto]

        @prezzo_min = params[:prezzomin]
        @prezzo_max = params[:prezzomax]
        if @prezzo_min == nil
            @prezzo_min = 0
        end
        if @prezzo_max == nil
            @prezzo_max = 100000000000
        end
        @marketcap_min = params[:marketcapmin]
        @marketcap_max = params[:marketcapmax]
        if @marketcap_min == nil
            @marketcap_min = 0
        end
        if @marketcap_max == nil
            @marketcap_max = 100000000000
        end
        @settore_scelto = params[:settorescelto]
        @volume_min = params[:volumemin]
        @volume_max = params[:volumemax]
        if @volume_min == nil
            @volume_min = 0
        end
        if @volume_max == nil
            @volume_max = 100000000000
        end
        @ebitda_min = params[:ebitdamin]
        @ebitda_max = params[:ebitdamax]
        if @ebitda_min == nil
            @ebitda_min = 0
        end
        if @ebitda_max == nil
            @ebitda_max = 100000000000
        end
        @roe_min = params[:roemin]
        @roe_max = params[:roemax]
        if @roe_min == nil
            @roe_min = -10000000000
        end
        if @roe_max == nil
            @roe_max = 100000000000
        end
        @roa_min = params[:roamin]
        @roa_max = params[:roamax]
        if @roa_min == nil
            @roa_min = -10000000000
        end
        if @roa_max == nil
            @roa_max = 100000000000
        end
        @pe_min = params[:pemin]
        @pe_max = params[:pemax]
        if @pe_min == nil
            @pe_min = 0
        end
        if @pe_max == nil
            @pe_max = 100000000000
        end
        @ps_min = params[:psmin]
        @ps_max = params[:psmax]
        if @ps_min == nil
            @ps_min = 0
        end
        if @ps_max == nil
            @ps_max = 100000000000
        end
        @pb_min = params[:pbmin]
        @pb_max = params[:pbmax]
        if @pb_min == nil
            @pb_min = 0
        end
        if @pb_max == nil
            @pb_max = 100000000000
        end
        @dy_min = params[:dymin]
        @dy_max = params[:dymax]
        if @dy_min == nil
            @dy_min = 0
        end
        if @dy_max == nil
            @dy_max = 100000000000
        end
        @de_min = params[:demin]
        @de_max = params[:demax]
        if @de_min == nil
            @de_min = 0
        end
        if @de_max == nil
            @de_max = 100000000000
        end
        @opm_min = params[:opmmin]
        @opm_max = params[:opmmax]
        if @opm_min == nil
            @opm_min = 0
        end
        if @opm_max == nil
            @opm_max = 100000000000
        end
        @screener = Screener.new(screener_params)
        if @screener.aggiorna
            respond_to do |format|
                format.html{redirect_to '/screener', notice: "Screener was successfully updated"}
            end
        end

        @soluzione=Azione.where(paese: @paese_scelto)
        #redirect_to request.referer || root_path
       #@risultati = Azione.where(@paese_scelto in [Azione.paese, "Qualsiasi"], @prezzo.in @prezzo_min.to_i..@prezzo_max.to_i, marketcap: @marketcap_min.to_i..@marketcap_max.to_i, settore: [@settore_scelto, "Qualsiasi"], volume: @volume_min.to_i..@volume_max.to_i, ebitda: @ebitda_min.to_i..@ebitda_max.to_i, roe: @roe_min.to_i..@roe_max.to_i, roa: @roa_min.to_i..@roa_max.to_i, pe: @pe_min.to_i..@pe_max.to_i, ps: @ps_min.to_i..@ps_max.to_i, pb: @pb_min.to_i..@pb_max.to_i, divyield: @dy_min.to_i..@dy_max.to_i, debteq: @de_min.to_i..@de_max.to_i, opmargin: @opm_min.to_i..@opm_max.to_i)
    end

    def aggiungi
        @aggiunta = Azione.all
        lista=[]
        @aggiunta.each do |x|
          lista.push(x.isin)
        end
        @isin = params[:isin].upcase
        @numero = params[:quantita].to_i
        if lista.include?(@isin)
          @tmp=Wallet.where(user:current_user.username,azione:@isin).first
          if @tmp==nil
            Wallet.create(user:current_user.username,azione:@isin,quantità:@numero)
          else
            n=@tmp.quantità+@numero
            @tmp.update(quantità:n)
          end
        else
          flash[:notice]=@isin+" non è un isin valido, scegline uno tra quelli proposti nel menu a tendina"
        end
    
        redirect_to '/wallet'
    end
    private
        def screener_params
            params.require(:screener).permit(:paesescelto)#, :prezzomin, :prezzomax, :marketcapmin, :marketcapmax, :settorescelto, :volumemin, :volumemax, :ebitdamin, :ebitdamax, :roemin, :roemax, :roamin, :roamax, :pemin, :pemax, :psmin, :psmax, :pbmin, :pbmax, :dymin, :dymax, :demin, :demax, :opmmin, :opmmax)
        end
end
