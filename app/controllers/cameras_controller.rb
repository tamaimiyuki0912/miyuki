class CamerasController < ApplicationController

    def index
        @cameras = Camera.all
    end

    def new
        @camera = Camera.new
    end

    def show
        @camera = Camera.find(params[:id])
    end

    def create
        camera = Camera.new(camera_params)

            if camera.save
                redirect_to :action => "index"
            else
                redirect_to :action => "new"
            end
    end

    def edit
    end

    def destroy
    end

    def update
    end

    private
    def camera_params
        
    end
end
