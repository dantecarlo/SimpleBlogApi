# frozen_string_literal: true

class Types::PostType < Types::BaseObject
  description 'A post of an user'

  field :id, ID, null: false
  field :user_id, Int, null: true, camelize: false
  field :body, String, null: true
  
  field :comments, [Types::CommentType], null: true
end
