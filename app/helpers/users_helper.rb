module UsersHelper
    def user_can_upgrade?(user)
        current_user == user && current_user.role == 'member'
     end
end
