class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @user=current_user
    if(@user.immagine==nil)
      @user.immagine="profilo"
      @user.save
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    if @user.immagine==nil
      @user.immagine="profilo"
    end
    if(current_user==@user)
      redirect_to "/users"
    end
    @azioni=Wallet.where(user:@user.username)
    @nome=Array.new
    @quantita=Array.new
    @azioni.each do |azione|
      @prezzotot=Azione.where(isin: azione.azione )
      @nome.push(azione.azione.to_s)
      @prezzotot=@prezzotot[0].prezzo*azione.quantità
      @quantita.push(@prezzotot)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user.id != current_user.id
      redirect_to users_path, alert: "Non puoi modificare il profilo di un altro utente"
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Utente creato con successo." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "Utente modificato con successo." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/", notice: "Utente eliminato con successo." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nome, :cognome, :email, :username, :pubblico, :commento,:immagine)
    end
end
