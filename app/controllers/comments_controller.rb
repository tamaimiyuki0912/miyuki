class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        camera = Camera.find(params[:camera_id])
        comment = camera.comments.build(comment_params)
        comment.user_id = current_user.id
            if comment.save
                flash[:success] = "コメントしました"
                redirect_back(fallback_location: root_path)
            else
                flash[:success] = "コメントできませんでした"
                redirect_back(fallback_location: root_path)
            end
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to cameras_path
    end

    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end


