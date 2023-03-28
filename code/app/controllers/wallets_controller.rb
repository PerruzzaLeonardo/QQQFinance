class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  # GET /wallets or /wallets.json
  def index
    @az=Azione.all
    if !user_signed_in?
      redirect_to '/users/sign_in', alert: "Per accedere al wallet è necessario effettuare l'accesso"
    else
      @curr_user=current_user.username
      @posizioni = Wallet.where(user:@curr_user)
      @azioni = [] #nuova variabile contenente le info dell'azione estratta
      @quantita = [] #variabile indica la quantita di azione i-esima in "posizioni" che l'utente detiene
      @tot=0
      i=0
      @posizioni.each do |posizione|
        @azioni[i]=Azione.where(isin:posizione.azione).first
        @quantita[i]=posizione.quantità
        @tot=@tot+(posizione.quantità*@azioni[i].prezzo)
        i+=1
      end
      #variabile contenente gli stessi valori di 'azioni' ma sottoforma di ActiveRecord:Relation invece che di array
      @prova = Azione.where(id: @azioni)
    end
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def movimenti
    @az=Azione.all
    lista=[]
    @az.each do |x|
      lista.push(x.isin)
    end
    @isin = params[:isin].upcase
    @numero = params[:quantita].to_i
    if lista.include?(@isin)
      @tmp=Wallet.where(user:current_user.username,azione:@isin).first
      if @tmp==nil
        Wallet.create(user:current_user.username,azione:@isin,quantità:@numero)
        flash[:notice]="Posizione aggiunta"
      else
        n=@tmp.quantità+@numero
        @tmp.update(quantità:n)
        flash[:notice]="Posizione aggiornata"
      end
    else
      flash[:alert]=@isin+" non è un isin valido, scegline uno tra quelli proposti nel menu a tendina"
    end

    redirect_to '/wallet' 
  end

  def elimina
    @wallet = Wallet.find_by(azione: params[:isin],user:current_user.username)
    @wallet.destroy
  
    redirect_to '/wallet',notice: "Posizione rimossa"
  end

  def rimozione
    @wallet=Wallet.where(user:current_user.username)
    @wallet.destroy_all
    redirect_to '/wallet',notice:"Il wallet è stato svuotato"
  end
  # GET /wallets/1 or /wallets/1.json
  def show
  end

  # GET /wallets/new
  def new
    @wallet = Wallet.new
  end

  # GET /wallets/1/edit
  def edit
  end

  # POST /wallets or /wallets.json
  def create
    @wallet = Wallet.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to wallet_url(@wallet), notice: "Wallet was successfully created." }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:user, :azione, :quantità)
    end
end