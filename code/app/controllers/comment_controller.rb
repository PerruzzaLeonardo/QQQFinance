class CommentController < ApplicationController
  def index
    @commenti=Comment.all
  end
  
  def update
    @commento=Comment.find(params[:id])
    respond_to do |format|
      if @commento.update(comment_params)
        format.html { redirect_to azione_url(@commento.azione_id), notice: "comment was successfully updated." }
      else
        format.html { redirect_to azione_url(@commento.azione_id),notice: "error to updated comment." }    
      end
    end
  end

  def create     
    @commento = Comment.new(comment_params)
    
    respond_to do |format|
      if @commento.save
        format.html { redirect_to azione_url(@commento.azione_id), notice: "comment was successfully created." }   
      else
        format.html { render :new, status: :unprocessable_entity }     
      end 
    end
  end 

  def destroy
    @commento=Comment.find(params[:id])
    @commento.destroy
    
    respond_to do |format|
      format.html { redirect_to azione_url(@commento.azione_id), notice: "comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.permit(:user_id,:azione_id,:commento)
  end
end