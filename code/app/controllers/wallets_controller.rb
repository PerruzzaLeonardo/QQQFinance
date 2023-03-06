class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]

  # GET /wallets or /wallets.json
  def index
    if !user_signed_in?
      redirect_to '/users/sign_in',notice: 'Per accedere alla pagina del Wallet, è prima necessario autenticarsi col proprio account' 
    else
      @curr_user=current_user.username
      @posizioni = Wallet.where(user:@curr_user)
      @azioni = [] #nuova variabile contenente le info dell'azione estratta
      @quantita = [] #variabile indica la quantita di azione i-esima in "posizioni" che l'utente detiene
      @tot=0
      i=0
      @posizioni.each do |posizione|
        #in azione dovrei avere tuple username,azione,quantita. vedere come è fatta la variabile ed estrarre nelle due righe sotto
        #solo 'azione' nella prima e solo 'quantita' nella seconda (controlla se giusto come fatto)
        @azioni[i]=Azione.where(isin:posizione.azione).first
        @quantita[i]=posizione.quantità
        @tot=@tot+(posizione.quantità*@azioni[i].prezzo)
        i+=1
      end
      render :text => @posizioni.inspect
    end
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

  def destroy
    @wallet=Wallet.find(params[:id])
    @wallet.destroy
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

  # PATCH/PUT /wallets/1 or /wallets/1.json
  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to wallet_url(@wallet), notice: "Wallet was successfully updated." }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1 or /wallets/1.json
  def destroy
    @wallet.destroy

    respond_to do |format|
      format.html { redirect_to wallets_url, notice: "Wallet was successfully destroyed." }
      format.json { head :no_content }
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