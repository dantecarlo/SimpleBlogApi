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

    field :create_comment, CommentType, null: true, description: 'Create a Comment' do
      argument :user_id, Int, required: true
      argument :body, String, required: true
    end

    def create_comment(user_id:, body:)
      Comment.create user_id: user_id, body: body
    end

    field :update_comment, Boolean, null: false, description: 'Update a Comment' do
      argument :id, ID, required: true
      argument :user_id, Int, required: true
      argument :body, String, required: true
    end

    def update_comment(id:, user_id:, body:)
      existing = Comment.where(id: comment[id]).first
      existing&.update user_id: user_id, body: body
    end

    field :delete_comment, Boolean, null: false, description: 'Delete a Comment' do
      argument :id, ID, required: true
    end

    def delete_comment(id:)
      Comment.where(id: id).destroy_all
      true
    end

    field :create_post, PostType, null: true, description: 'Create a Post' do
      argument :user_id, Int, required: true
      argument :body, String, required: true
    end

    def create_post(user_id:, body:)
      Post.create user_id: user_id, body: body
    end

    field :update_post, Boolean, null: false, description: 'Update a Post' do
      argument :user, Types::UserInputType, required: true
    end

    def update_post(id:, user_id:, body:)
      existing = Post.where(id: post[id]).first
      existing&.update user_id: user_id, body: body
    end

    field :delete_post, Boolean, null: false, description: 'Delete a Post' do
      argument :id, ID, required: true
    end

    def delete_post(id:)
      Post.where(id: id).destroy_all
      true
    end
  end
end
