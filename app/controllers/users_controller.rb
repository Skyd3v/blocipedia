class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
     end

     def downgrade
         flash[:notice] = "Please try our Premium services again in the future, #{current_user.email}!"
         current_user.member!
         redirect_to current_user
    end
end
