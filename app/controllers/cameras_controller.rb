class CamerasController < ApplicationController

    def index
        @cameras = Camera.all
    end

    def new
        @camera = Camera.new
    end

    def show
        @camera = Camera.find(params[:id])
        @user = User.find_by(id: @camera.user_id)
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

