class WikisController < ApplicationController
    def index
        @wikis = Wiki.all
    end

    def show
        @wiki = Wiki.find(params[:id])
    end

    def new
        @wiki = Wiki.new
    end

    def create
        # #9
        @wiki = Wiki.new
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]

        # #10
        if @wiki.save
            # #11
            flash[:notice] = 'Wiki was saved.'
            redirect_to @wiki
        else
            # #12
            flash.now[:alert] = 'There was an error saving the wiki. Please try again.'
            render :new
        end
    end

    def edit
        @wiki = Wiki.find(params[:id])
    end

    def update
        @wiki = Wiki.find(params[:id])
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]

        if @wiki.save
            flash[:notice] = 'Wiki was updated.'
            redirect_to @wiki
        else
            flash.now[:alert] = 'There was an error saving the wiki. Please try again.'
            render :edit
        end
   end

    def destroy
        @wiki = Wiki.find(params[:id])

        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = 'There was an error deleting the Wiki.'
            render :show
        end
    end
end
