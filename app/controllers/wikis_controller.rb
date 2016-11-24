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
    end
end
