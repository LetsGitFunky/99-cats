class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cats.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end


    def create
        @cat = Cat.new(cat_params)
        
        if @cat.save
            redirect_to cats_url
        else
            # WILL NEED MORE ATTENTION TO LINK
            @errors = @cat.errors.full_messages
            render :new
        end

    end


    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])

        if @cat.update(cat_params)
            redirect_to cats_url(@cat)  
        else
            render :update
        end

    end

    private

    def cat_params
        params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
    end


end
