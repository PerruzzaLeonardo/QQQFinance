class CommentController < ApplicationController
    def index
        @commenti=Comment.all
    end
    def new
        @Commento=Comment.new
    end

    def create
       
        @commento = Comment.new(comment_params)
    
        respond_to do |format|
          if @commento.save
            format.html { redirect_to azione_url(@commento.isin), notice: "comment was successfully created." }
            format.json { render :show, status: :created, location: @commento }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @commento.errors, status: :unprocessable_entity }
          end
        end
      end 

    private

    def comment_params
        params.permit(:user,:isin,:commento)
      end
end