class CollaborationPolicy < ApplicationPolicy
    def new?
        user.admin? || user.premium?
    end
end
