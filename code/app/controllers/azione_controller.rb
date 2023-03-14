class AzioneController < ApplicationController
  def index

  end

  def show
    @azione =Azione.find(params[:id])
    @commenti=Comment.where(azione_id: @azione.id )
    #@cuser=Users.where(id: @commenti.user_id)
  end

  def new
    @azione=Azione.new
  end
  
  def create
    @azione = Azione.new(azione_params)
    
    respond_to do |format|
      if @azione.save
        format.html { redirect_to azione_url(@azione), notice: "azione was successfully created." }
        format.json { render :show, status: :created, location: @azione }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @azione.errors, status: :unprocessable_entity }
      end
    end
  end 
    
  def update
    respond_to do |format|
      if @azione.update(azione_params)
        format.html { redirect_to azione_url(@azione), notice: "azione was successfully updated." }
        format.json { render :show, status: :ok, location: @azione }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @azione.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def azione_params
    params.require(:azione).permit(:nome, :isin, :settore, :paese, :marketcap, :prezzo, :volume, :pe, :ps, :pb, :divyield, :roe, :roa, :debteq, :opmargin, :ebitda)
  end
end