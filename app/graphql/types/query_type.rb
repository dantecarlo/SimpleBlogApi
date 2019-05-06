# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: true, description: 'An User' do
      argument :id, ID, required: true, description: 'A user id'
    end

    def user(id:)
      User.where(id: id).first
    end
  end
end
