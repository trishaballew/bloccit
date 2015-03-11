class CommentPolicy < ApplicationPolicy
end

def new?
  create?
end

def create?
  user.present?
end


