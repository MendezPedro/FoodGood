class CommentsController < ApplicationController
    #before_action :authenticate_user!

    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
    end

    def create
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id
        respond_to do |format|
            if @comment.save 
                format.js { redirect_to posts_path, notice: 'Comentario creada' }
            else
                format.js { redirect_to posts_path, alert: 'debe contener texto' }
            end
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
