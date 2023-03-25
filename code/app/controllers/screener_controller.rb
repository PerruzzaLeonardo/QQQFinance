class ScreenerController < ApplicationController
    helper_method :sort_column, :sort_direction
        
    def index
        @aggiunta = Azione.all
        @soluzione = Azione.all
        l=[]
  
        @paese_scelto = params[:paesescelto]
        if @paese_scelto != "Qualsiasi" && @paese_scelto != nil
            @soluzione = @soluzione.where(paese: @paese_scelto)
            l.push("Paese: " + @paese_scelto.to_s)
        end
        
        @prezzo_min = params[:prezzomin]
        @prezzo_max = params[:prezzomax]
        if @prezzo_min != "" && @prezzo_min != nil
            @soluzione = @soluzione.where("prezzo >= ?", @prezzo_min.to_f)
            l.push("Prezzo minimo = " + @prezzo_min.to_s)
        end
        if @prezzo_max != "" && @prezzo_max != nil
            @soluzione = @soluzione.where("prezzo <= ?", @prezzo_max.to_f)
            l.push("Prezzo massimo = " + @prezzo_max.to_s)
        end

        @marketcap_min = params[:marketcapmin]
        @marketcap_max = params[:marketcapmax]
        if @marketcap_min != "" && @marketcap_min != nil
            @soluzione = @soluzione.where("marketcap >= ?", @marketcap_min.to_f)
            l.push("Marketcap minimo = " + @marketcap_min.to_s)
        end
        if @marketcap_max != "" && @marketcap_max != nil
            @soluzione = @soluzione.where("marketcap <= ?", @marketcap_max.to_f)
            l.push("Marketcap massimo = " + @marketcap_max.to_s)
        end
        
        @settore_scelto = params[:settorescelto]
        if @settore_scelto != "Qualsiasi" && @settore_scelto != nil
            @soluzione = @soluzione.where(settore: @settore_scelto)
            l.push("Settore = " + @settore_scelto.to_s)
        end

        @volume_min = params[:volumemin]
        @volume_max = params[:volumemax]
        if @volume_min != "" && @volume_min != nil
            @soluzione = @soluzione.where("volume >= ?", @volume_min.to_f)
            l.push("Volume minimo = " + @volume_min.to_s)
        end
        if @volume_max != "" && @volume_max != nil
            @soluzione = @soluzione.where("volume <= ?", @volume_max.to_f)
            l.push("Volume massimo = " + @volume_max.to_s)
        end
        
        @ebitda_min = params[:ebitdamin]
        @ebitda_max = params[:ebitdamax]
        if @ebitda_min != "" && @ebitda_min != nil
            @soluzione = @soluzione.where("ebitda >= ?", @ebitda_min.to_f)
            l.push("EBITDA minimo = " + @ebitda_min.to_s)
        end
        if @ebitda_max != "" && @ebitda_max != nil
            @soluzione = @soluzione.where("ebitda <= ?", @ebitda_max.to_f)
            l.push("EBITDA massimo = " + @ebitda_max.to_s)
        end
        
        @roe_min = params[:roemin]
        @roe_max = params[:roemax]
        if @roe_min != "" && @roe_min != nil
            @soluzione = @soluzione.where("roe >= ?", @roe_min.to_f)
            l.push("ROE minimo = " + @roe_min.to_s)
        end
        if @roe_max != "" && @roe_max != nil
            @soluzione = @soluzione.where("roe <= ?", @roe_max.to_f)
            l.push("ROE massimo = " + @roe_max.to_s)
        end
        
        @roa_min = params[:roamin]
        @roa_max = params[:roamax]
        if @roa_min != "" && @roa_min != nil
            @soluzione = @soluzione.where("roa >= ?", @roa_min.to_f)
            l.push("ROA minimo = " + @roa_min.to_s)
        end
        if @roa_max != "" && @roa_max != nil
            @soluzione = @soluzione.where("roa <= ?", @roa_max.to_f)
            l.push("ROA massimo = " + @roa_max.to_s)
        end
        
        @pe_min = params[:pemin]
        @pe_max = params[:pemax]
        if @pe_min != "" && @pe_min != nil
            @soluzione = @soluzione.where("pe >= ?", @pe_min.to_f)
            l.push("PE minimo = " + @pe_min.to_s)
        end
        if @pe_max != "" && @pe_max != nil
            @soluzione = @soluzione.where("pe <= ?", @pe_max.to_f)
            l.push("PE massimo = " + @pe_max.to_s)
        end
        
        @ps_min = params[:psmin]
        @ps_max = params[:psmax]
        if @ps_min != "" && @ps_min != nil
            @soluzione = @soluzione.where("ps >= ?", @ps_min.to_f)
            l.push("PS minimo = " + @ps_min.to_s)
        end
        if @ps_max != "" && @ps_max != nil
            @soluzione = @soluzione.where("ps <= ?", @ps_max.to_f)
            l.push("PS massimo = " + @roe_max.to_s)
        end
        
        @pb_min = params[:pbmin]
        @pb_max = params[:pbmax]
        if @pb_min != "" && @pb_min != nil
            @soluzione = @soluzione.where("pb >= ?", @pb_min.to_f)
            l.push("PB minimo = " + @pb_min.to_s)
        end
        if @pb_max != "" && @pb_max != nil
            @soluzione = @soluzione.where("pb <= ?", @pb_max.to_f)
            l.push("PB massimo = " + @pb_max.to_s)
        end
        
        @dy_min = params[:dymin]
        @dy_max = params[:dymax]
        if @dy_min != "" && @dy_min != nil
            @soluzione = @soluzione.where("divyield >= ?", @dy_min.to_f)
            l.push("Div Yield minimo = " + @dy_min.to_s)
        end
        if @dy_max != "" && @dy_max != nil
            @soluzione = @soluzione.where("divyield <= ?", @dy_max.to_f)
            l.push("Div Yield massimo = " + @dy_max.to_s)
        end
        
        @de_min = params[:demin]
        @de_max = params[:demax]
        if @de_min != "" && @de_min != nil
            @soluzione = @soluzione.where("debteq >= ?", @de_min.to_f)
            l.push("Debt Eq minimo = " + @de_min.to_s)
        end
        if @de_max != "" && @de_max != nil
            @soluzione = @soluzione.where("debteq <= ?", @de_max.to_f)
            l.push("Debt Eq massimo = " + @de_max.to_s)
        end
        
        @opm_min = params[:opmmin]
        @opm_max = params[:opmmax]
        if @opm_min != "" && @opm_min != nil
            @soluzione = @soluzione.where("opmargin >= ?", @opm_min.to_f)
            l.push("Op Margin minimo = " + @opm_min.to_s)
        end
        if @opm_max != "" && @opm_max != nil
            @soluzione = @soluzione.where("opmargin <= ?", @opm_max.to_f)
            l.push("Op Margin massimo = " + @opm_max.to_s)
        end

        if l != []
            flash[:filtri] = "Azioni filtrate attraverso i seguenti parametri: "+ l.to_s
        else
            flash[:filtri] = "Elenco completo delle azioni"
        end

        if @soluzione.length == 0
            flash[:errore] = "Nessuna azione trovata secondo i parametri scelti"
        end
    end

    def sort_column
        Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    #private
        #def screener_params
            #params.require(:screener).permit(:paesescelto, :prezzomin, :prezzomax, :marketcapmin, :marketcapmax, :settorescelto, :volumemin, :volumemax, :ebitdamin, :ebitdamax, :roemin, :roemax, :roamin, :roamax, :pemin, :pemax, :psmin, :psmax, :pbmin, :pbmax, :dymin, :dymax, :demin, :demax, :opmmin, :opmmax)
        #end

end