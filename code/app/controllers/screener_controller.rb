class ScreenerController < ApplicationController
        
    def index
        @aggiunta = Azione.all
        @soluzione = Azione.all

        order_by = params[:order_by] || "default_order_column"
        direction = params[:direction] || "asc"
  
        case order_by
        when "nome"
            @soluzione = @soluzione.order(nome: direction)
        when "isin"
            @soluzione = @soluzione.order(isin: direction)
        when "paese"
            @soluzione = @soluzione.order(paese: direction)
        when "prezzo"
            @soluzione = @soluzione.order(prezzo: direction)
        when "marketcap"
            @soluzione = @soluzione.order(marketcap: direction)
        when "settore"
            @soluzione = @soluzione.order(settore: direction)
        when "volume"
            @soluzione = @soluzione.order(volume: direction)
        when "ebitda"
            @soluzione = @soluzione.order(ebitda: direction)
        when "roe"
            @soluzione = @soluzione.order(roe: direction)
        when "roa"
            @soluzione = @soluzione.order(roa: direction)
        when "pe"
            @soluzione = @soluzione.order(pe: direction)
        when "ps"
            @soluzione = @soluzione.order(ps: direction)
        when "pb"
            @soluzione = @soluzione.order(pb: direction)
        when "divyield"
            @soluzione = @soluzione.order(divyield: direction)
        when "debteq"
            @soluzione = @soluzione.order(debteq: direction)
        when "opmargin"
            @soluzione = @soluzione.order(opmargin: direction)
        else
            @soluzione = @soluzione.order(default_order_column: direction)
        end

        @paese_scelto = params[:paesescelto]
        if @paese_scelto != "Qualsiasi" && @paese_scelto != nil
            @soluzione = @soluzione.where(paese: @paese_scelto)
        end
        
        @prezzo_min = params[:prezzomin]
        @prezzo_max = params[:prezzomax]
        if @prezzo_min != "" && @prezzo_min != nil
            @soluzione = @soluzione.where("prezzo >= ?", @prezzo_min.to_f)
        end
        if @prezzo_max != "" && @prezzo_max != nil
            @soluzione = @soluzione.where("prezzo <= ?", @prezzo_max.to_f)
        end

        @marketcap_min = params[:marketcapmin]
        @marketcap_max = params[:marketcapmax]
        if @marketcap_min != "" && @marketcap_min != nil
            @soluzione = @soluzione.where("marketcap >= ?", @marketcap_min.to_f)
        end
        if @marketcap_max != "" && @marketcap_max != nil
            @soluzione = @soluzione.where("marketcap <= ?", @marketcap_max.to_f)
        end
        
        @settore_scelto = params[:settorescelto]
        if @settore_scelto != "Qualsiasi" && @settore_scelto != nil
            @soluzione = @soluzione.where(settore: @settore_scelto)
        end

        @volume_min = params[:volumemin]
        @volume_max = params[:volumemax]
        if @volume_min != "" && @volume_min != nil
            @soluzione = @soluzione.where("volume >= ?", @volume_min.to_f)
        end
        if @volume_max != "" && @volume_max != nil
            @soluzione = @soluzione.where("volume <= ?", @volume_max.to_f)
        end
        
        @ebitda_min = params[:ebitdamin]
        @ebitda_max = params[:ebitdamax]
        if @ebitda_min != "" && @ebitda_min != nil
            @soluzione = @soluzione.where("ebitda >= ?", @ebitda_min.to_f)
        end
        if @ebitda_max != "" && @ebitda_max != nil
            @soluzione = @soluzione.where("ebitda <= ?", @ebitda_max.to_f)
        end
        
        @roe_min = params[:roemin]
        @roe_max = params[:roemax]
        if @roe_min != "" && @roe_min != nil
            @soluzione = @soluzione.where("roe >= ?", @roe_min.to_f)
        end
        if @roe_max != "" && @roe_max != nil
            @soluzione = @soluzione.where("roe <= ?", @roe_max.to_f)
        end
        
        @roa_min = params[:roamin]
        @roa_max = params[:roamax]
        if @roa_min != "" && @roa_min != nil
            @soluzione = @soluzione.where("roa >= ?", @roa_min.to_f)
        end
        if @roa_max != "" && @roa_max != nil
            @soluzione = @soluzione.where("roa <= ?", @roa_max.to_f)
        end
        
        @pe_min = params[:pemin]
        @pe_max = params[:pemax]
        if @pe_min != "" && @pe_min != nil
            @soluzione = @soluzione.where("pe >= ?", @pe_min.to_f)
        end
        if @pe_max != "" && @pe_max != nil
            @soluzione = @soluzione.where("pe <= ?", @pe_max.to_f)
        end
        
        @ps_min = params[:psmin]
        @ps_max = params[:psmax]
        if @ps_min != "" && @ps_min != nil
            @soluzione = @soluzione.where("ps >= ?", @ps_min.to_f)
        end
        if @ps_max != "" && @ps_max != nil
            @soluzione = @soluzione.where("ps <= ?", @ps_max.to_f)
        end
        
        @pb_min = params[:pbmin]
        @pb_max = params[:pbmax]
        if @pb_min != "" && @pb_min != nil
            @soluzione = @soluzione.where("pb >= ?", @pb_min.to_f)
        end
        if @pb_max != "" && @pb_max != nil
            @soluzione = @soluzione.where("pb <= ?", @pb_max.to_f)
        end
        
        @dy_min = params[:dymin]
        @dy_max = params[:dymax]
        if @dy_min != "" && @dy_min != nil
            @soluzione = @soluzione.where("divyield >= ?", @dy_min.to_f)
        end
        if @dy_max != "" && @dy_max != nil
            @soluzione = @soluzione.where("divyield <= ?", @dy_max.to_f)
        end
        
        @de_min = params[:demin]
        @de_max = params[:demax]
        if @de_min != "" && @de_min != nil
            @soluzione = @soluzione.where("debteq >= ?", @de_min.to_f)
        end
        if @de_max != "" && @de_max != nil
            @soluzione = @soluzione.where("debteq <= ?", @de_max.to_f)
        end
        
        @opm_min = params[:opmmin]
        @opm_max = params[:opmmax]
        if @opm_min != "" && @opm_min != nil
            @soluzione = @soluzione.where("opmargin >= ?", @opm_min.to_f)
        end
        if @opm_max != "" && @opm_max != nil
            @soluzione = @soluzione.where("opmargin <= ?", @opm_max.to_f)
        end
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

    #private
        #def screener_params
            #params.require(:screener).permit(:paesescelto, :prezzomin, :prezzomax, :marketcapmin, :marketcapmax, :settorescelto, :volumemin, :volumemax, :ebitdamin, :ebitdamax, :roemin, :roemax, :roamin, :roamax, :pemin, :pemax, :psmin, :psmax, :pbmin, :pbmax, :dymin, :dymax, :demin, :demax, :opmmin, :opmmax)
        #end

end