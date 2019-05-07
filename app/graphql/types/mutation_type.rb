# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, UserType, null: true, description: 'Create an User' do
      argument :user, Types::UserInputType, required: true
    end

    def create_user(user:)
      User.create user.to_h
    end

    field :update_user, Boolean, null: false, description: 'Update an User' do
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.where(id: user[:id]).first
      existing&.update user.to_h
    end


    field :delete_user, Boolean, null: false, description: 'Delete an User' do
      argument :id, ID, required: true
    end

    def delete_user(id:)
      Author.where(id: id).destroy_all
      true
    end

  end
end
