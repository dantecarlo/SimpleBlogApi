# frozen_string_literal: true

class Types::CommentType < Types::BaseObject
  description 'A comment of an user'

  field :id, ID, null: false
  field :user_id, Int, null: true, camelize: false
  field :body, String, null: true
end
