class AzioniController < ApplicationController
  def index
  end

  def show
    @azione =Azione.find(params[:id])
  end
end
