class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def downgrade
        user = current_user

        if user.role == 'premium'
            user.role = 0

            if user.save
                make_public
                flash[:notice] = 'Your account has been changed to a Standard account. Feel free to upgrade at any time!'
                redirect_to root_path
            else
                flash[:alert] = 'Account downgrade failed. Please try again at another time.'
                redirect_to root_path
            end
        else
            flash[:alert] = 'Your account is already Standard and cannot be downgraded, or you are an Admin.'
        end
    end

    def make_public
        wikis = Wiki.where(user_id: current_user.id)
        wikis.update_all(private: false)
    end
end
