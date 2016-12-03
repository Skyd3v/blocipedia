class WikisController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:index, :show, :edit, :update]

    def index
        @wikis = Wiki.visible_to(current_user)
    end

    def show
        @wiki = Wiki.find(params[:id])
        unless @wiki.private == false || current_user.role == 'admin' || current_user.role == 'premium'
            flash[:alert] = 'You must upgrade your account to view private Wiki entries.'
            redirect_to root_path
    end
    end

    def new
        @wiki = Wiki.new
    end

    def create
        @wiki = Wiki.create(wiki_params)
        @wiki.user = current_user

        if @wiki.save
            flash[:notice] = 'Wiki was saved.'
            redirect_to @wiki
        else
            flash.now[:alert] = 'There was an error saving the wiki. Please try again.'
            render :new
        end
    end

    def edit
        @wiki = Wiki.find(params[:id])
    end

    def update
        @wiki = Wiki.find(params[:id])
        authorize @wiki
        @wiki.assign_attributes(wiki_params)

        if @wiki.save
            flash[:notice] = 'Wiki was updated'
            redirect_to @wiki
        else
            flash.now[:alert] = 'Error saving wiki. Please try again.'
            render :edit
        end
    end

    def destroy
        @wiki = Wiki.find(params[:id])

        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = 'There was an error deleting the wiki'
            render :show
        end
    end

    private

    def wiki_params
        params.require(:wiki).permit(:title, :body, :private)
    end
end
