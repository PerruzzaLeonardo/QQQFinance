class CommentController < ApplicationController
  def update
    @commento=Comment.find(params[:id])
    respond_to do |format|
      if @commento.update(comment_params)
        format.html { redirect_to azione_url(@commento.azione_id), notice: "Commento modificato con successo." }
      else
        format.html { redirect_to azione_url(@commento.azione_id),notice: "Errore nella modifica del commento." }    
      end
    end
  end

  def create     
    @commento = Comment.new(comment_params)
    
    respond_to do |format|
      if @commento.save
        format.html { redirect_to azione_url(@commento.azione_id), notice: "Commento creato con successo." }   
      else
        format.html { render :new, status: :unprocessable_entity,notice: "Errore nella creazione del commento." }     
      end 
    end
  end 

  def destroy
    @commento=Comment.find(params[:id])
    @commento.destroy
    
    respond_to do |format|
      format.html { redirect_to azione_url(@commento.azione_id), notice: "Commento eliminato con successo." }
    end
  end

  private

  def comment_params
    params.permit(:user_id,:azione_id,:commento)
  end
end