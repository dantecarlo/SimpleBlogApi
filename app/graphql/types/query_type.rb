# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: true, description: 'An User' do
      argument :id, ID, required: true, description: 'An user id'
    end

    def user(id:)
      User.where(id: id).first
    end

    field :comment, Types::CommentType, null: true, description: 'Comment of an User' do
      argument :id, ID, required: true, description: 'A comment id'
    end

    def comment(id:)
      Comment.where(id: id).first
    end
  end
end
