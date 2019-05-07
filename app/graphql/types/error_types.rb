# frozen_string_literal: true

class Types::ErrorType < Types::BaseObject
  description 'An ActiveRecord error'

  filed :field_name, String, null: false, camelize: false
  filed :error, [String], null: false
end
