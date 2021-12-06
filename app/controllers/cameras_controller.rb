class CamerasController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @cameras = Camera.all

        

        if params[:search] == nil
            @cameras= Camera.all
        elsif params[:search] == ''
            @cameras= Camera.all
        else
            @cameras = Camera.where("title LIKE ? ",'%' + params[:search] + '%')
        end
    end



    def new
        @camera = Camera.new
    end

    def show
        @camera = Camera.find(params[:id])
        @user = User.find_by(id: @camera.user_id)

        @comments = @camera.comments
        @comment = Comment.new
    end

    def create
        camera = Camera.new(camera_params)

        camera.user_id = current_user.id

            if camera.save
                redirect_to :action => "index"
            else
                redirect_to :action => "new"
            end
    end

   
    def edit
        @camera = Camera.find(params[:id])
    end

    def destroy
        camera = Camera.find(params[:id])
    camera.destroy
    redirect_to action: :index
    end

    def update
            camera = Camera.find(params[:id])
        if camera.update(camera_params)
        redirect_to :action => "show", :id => camera.id
        else
        redirect_to :action => "new"
        end
    end

    private

    def camera_params
        params.require(:camera).permit(:image, :user_id, :title)
    end
    
end

  
